import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/failure.dart';
import 'package:movie_app/features/content/domain/entities/movie_entity.dart';
import 'package:movie_app/features/content/domain/usecases/movies/get_local_movies_use_case.dart';
import 'package:movie_app/features/content/domain/usecases/movies/get_remote_movies_use_case.dart';
import 'package:movie_app/features/content/domain/usecases/movies/search_movies_use_case.dart';
import 'package:movie_app/features/content/domain/usecases/movies/store_movies_use_case.dart';
import 'package:movie_app/service_locator.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final _getRemoteMoviesUseCase = sl<GetRemoteMoviesUseCase>();
  final _getLocalMoviesUseCase = sl<GetLocalMoviesUseCase>();
  final _storeMoviesUseCase = sl<StoreMoviesUseCase>();
  final _searchMoviesUseCase = sl<SearchMoviesUseCase>();

  MovieCubit() : super(MovieInitial());

  Future<void> getMovies() async {
    emit(MovieLoading());

    final localMovies = _getLocalMoviesUseCase.getMoviesLocally();
    localMovies.fold((failure) {}, (localMovies) {
      if (localMovies.isEmpty) {
        _loadRemoteMovies();
      } else {
        localMovies.sort((a, b) => b.releaseDate.compareTo(a.releaseDate));
        emit(MovieLoaded(localMovies));
      }
    });
  }

  Future<void> searchMovies(String query) async {
    emit(MovieLoading());
    final movies = await _searchMoviesUseCase(query);
    movies.fold((l) {}, (moviesFound) {
      moviesFound.sort((a, b) => b.releaseDate.compareTo(a.releaseDate));
      emit(MovieLoaded(moviesFound));
    });
  }

  Future<void> _loadRemoteMovies() async {
    final remoteMovies = await _getRemoteMoviesUseCase();
    remoteMovies.fold((failure) {
      emit(MovieFailure(failure));
    }, (movies) {
      movies.sort((a, b) => b.releaseDate.compareTo(a.releaseDate));
      emit(MovieLoaded(movies));
      _storeMoviesUseCase(movies);
    });
  }
}
