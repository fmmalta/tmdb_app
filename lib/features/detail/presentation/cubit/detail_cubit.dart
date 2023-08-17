import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/detail/domain/entities/content_interface.dart';
import 'package:movie_app/features/detail/domain/usecases/movie/get_local_movie_detail_use_case.dart';
import 'package:movie_app/features/detail/domain/usecases/movie/get_remote_movie_detail_use_case.dart';
import 'package:movie_app/features/detail/domain/usecases/movie/store_movie_detail_use_case.dart';
import 'package:movie_app/features/detail/domain/usecases/tvshow/get_local_tvshow_detail_use_case.dart';
import 'package:movie_app/features/detail/domain/usecases/tvshow/get_remote_tvshow_detail_use_case.dart';
import 'package:movie_app/features/detail/domain/usecases/tvshow/store_local_tvshow_detail_use_case.dart';
import 'package:movie_app/service_locator.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  final _getRemoteMovieDetailUseCase = sl<GetRemoteMovieDetailUseCase>();
  final _getRemoteTVShowDetailUseCase = sl<GetRemoteTVShowDetailUseCase>();
  final _getLocalMovieDetailUseCase = sl<GetLocalMovieDetailUseCase>();
  final _getLocalTVShowDetailUseCase = sl<GetLocalTVShowDetailUseCase>();
  final _storeMovieDetailUseCase = sl<StoreMovieDetailUseCase>();
  final _storeTvShowDetailUseCase = sl<StoreLocalTVShowDetailUseCase>();

  DetailCubit() : super(DetailInitial());

  Future<void> getContentDetail(Content content, ContentType type) {
    emit(DetailLoading());
    switch (type) {
      case ContentType.movie:
        return _getMovieDetail(content.id);
      case ContentType.tv:
        return _getTVShowDetail(content.id);
    }
  }

  Future<void> _getMovieDetail(int id) async {
    final localMovie = await _getLocalMovieDetailUseCase(id);
    localMovie.fold((failure) {
      _getMovieRemotly(id);
    }, (localMovie) {
      if (localMovie == null) {
        _getMovieRemotly(id);
      } else {
        emit(DetailLoaded(localMovie));
      }
    });
  }

  Future<void> _getMovieRemotly(int id) async {
    final movieDetail = await _getRemoteMovieDetailUseCase(id);
    movieDetail.fold(
      (failure) => emit(DetailFailure(failure)),
      (movie) {
        emit(DetailLoaded(movie));
        _storeMovieDetailUseCase(movie);
      },
    );
  }

  Future<void> _getTVShowDetail(int id) async {
    final localTVShow = await _getLocalTVShowDetailUseCase(id);
    localTVShow.fold((failure) {
      _getTVShowRemotly(id);
    }, (localTVShow) {
      if (localTVShow == null) {
        _getTVShowRemotly(id);
      } else {
        emit(DetailLoaded(localTVShow));
      }
    });
  }

  Future<void> _getTVShowRemotly(int id) async {
    final tvShowDetail = await _getRemoteTVShowDetailUseCase(id);
    tvShowDetail.fold(
      (failure) => emit(DetailFailure(failure)),
      (tvshow) {
        emit(DetailLoaded(tvshow));
        _storeTvShowDetailUseCase(tvshow);
      },
    );
  }
}
