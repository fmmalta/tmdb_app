import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/content/domain/entities/tvshows_entity.dart';
import 'package:movie_app/features/content/domain/usecases/tvshows/get_remote_tv_shows_use_case.dart';
import 'package:movie_app/features/content/domain/usecases/tvshows/search_tvshows_use_case.dart';
import 'package:movie_app/features/content/domain/usecases/tvshows/store_tv_shows_use_case.dart';
import 'package:movie_app/features/content/domain/usecases/tvshows/get_local_tv_shows_use_case.dart';
import 'package:movie_app/service_locator.dart';

part 'tvshows_state.dart';

class TvshowsCubit extends Cubit<TvshowsState> {
  final _getLocalTVShowsUseCase = sl<GetLocalTVShowsUseCase>();
  final _getRemoteTVShowsUseCase = sl<GetRemoteTVShowsUseCase>();
  final _storeTVShowsUseCase = sl<StoreTVShowsUseCase>();
  final _searchTVShowsUseCase = sl<SearchTVShowsUseCase>();

  TvshowsCubit() : super(TvshowsInitial());

  Future<void> getTVShows() async {
    emit(TvshowsLoading());
    final localTVShows = await _getLocalTVShowsUseCase();
    localTVShows.fold((failure) {
      _loadTVShowsRemote();
    }, (localTVShows) {
      if (localTVShows.isEmpty) {
        _loadTVShowsRemote();
      } else {
        emit(TvshowsLoaded(localTVShows));
      }
    });
  }

  Future<void> searchTvShows(String query) async {
    emit(TvshowsLoading());
    final movies = await _searchTVShowsUseCase(query);
    movies.fold((failure) {
      emit(TVShowFailure(failure));
    }, (tvShowsFound) {
      tvShowsFound.sort((a, b) => b.firstAirDate.compareTo(a.firstAirDate));
      emit(TvshowsLoaded(tvShowsFound));
    });
  }

  Future<void> _loadTVShowsRemote() async {
    final remoteTVShows = await _getRemoteTVShowsUseCase();
    remoteTVShows.fold((failure) {
      emit(TVShowFailure(failure));
    }, (tvshows) {
      emit(TvshowsLoaded(tvshows));
      _storeTVShowsUseCase(tvshows);
    });
  }
}
