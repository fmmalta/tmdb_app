import 'package:get_it/get_it.dart';
import 'package:movie_app/core/http_service.dart';
import 'package:movie_app/features/content/data/datasources/movies/movie_local_data_source.dart';
import 'package:movie_app/features/content/data/datasources/movies/movie_remote_data_source.dart';
import 'package:movie_app/features/content/data/datasources/tvshows/tvshows_local_data_source.dart';
import 'package:movie_app/features/content/data/datasources/tvshows/tvshows_remote_data_source.dart';
import 'package:movie_app/features/content/data/repositories/movies/movies_local_repository_impl.dart';
import 'package:movie_app/features/content/data/repositories/movies/movies_remote_repository_impl.dart';
import 'package:movie_app/features/content/data/repositories/tvshows/tvshows_local_repository_impl.dart';
import 'package:movie_app/features/content/data/repositories/tvshows/tvshows_remote_repository_impl.dart';
import 'package:movie_app/features/content/domain/repositories/movies/movies_remote_repository.dart';
import 'package:movie_app/features/content/domain/repositories/movies/movies_local_repository.dart';
import 'package:movie_app/features/content/domain/repositories/tvshows/tvshows_local_repository.dart';
import 'package:movie_app/features/content/domain/repositories/tvshows/tvshows_remote_repository.dart';
import 'package:movie_app/features/content/domain/usecases/movies/get_local_movies_use_case.dart';
import 'package:movie_app/features/content/domain/usecases/movies/get_remote_movies_use_case.dart';
import 'package:movie_app/features/content/domain/usecases/movies/search_movies_use_case.dart';
import 'package:movie_app/features/content/domain/usecases/tvshows/get_remote_tv_shows_use_case.dart';
import 'package:movie_app/features/content/domain/usecases/movies/store_movies_use_case.dart';
import 'package:movie_app/features/content/domain/usecases/tvshows/search_tvshows_use_case.dart';
import 'package:movie_app/features/content/domain/usecases/tvshows/store_tv_shows_use_case.dart';
import 'package:movie_app/features/content/domain/usecases/tvshows/get_local_tv_shows_use_case.dart';
import 'package:movie_app/features/detail/data/datasources/movie/movie_detail_remote_data_source.dart';
import 'package:movie_app/features/detail/data/datasources/movie/movie_local_remote_data_source.dart';
import 'package:movie_app/features/detail/data/datasources/tvshow/tvshow_detail_local_data_source.dart';
import 'package:movie_app/features/detail/data/datasources/tvshow/tvshow_detail_remote_data_source.dart';
import 'package:movie_app/features/detail/data/repositories/movie/movie_detail_local_repository_impl.dart';
import 'package:movie_app/features/detail/data/repositories/movie/movie_detail_remote_repository_impl.dart';
import 'package:movie_app/features/detail/data/repositories/tvshow/tvshow_local_detail_repository_impl.dart';
import 'package:movie_app/features/detail/data/repositories/tvshow/tvshow_remote_detail_repository_impl.dart';
import 'package:movie_app/features/detail/domain/repositories/movie_detail_repository/movie_detail_local_repository.dart';
import 'package:movie_app/features/detail/domain/repositories/movie_detail_repository/movie_detail_remote_repository.dart';
import 'package:movie_app/features/detail/domain/repositories/tvshow_detail_repository/tvshow_local_detail_repository.dart';
import 'package:movie_app/features/detail/domain/repositories/tvshow_detail_repository/tvshow_remote_detail_repository.dart';
import 'package:movie_app/features/detail/domain/usecases/movie/get_local_movie_detail_use_case.dart';
import 'package:movie_app/features/detail/domain/usecases/movie/get_remote_movie_detail_use_case.dart';
import 'package:movie_app/features/detail/domain/usecases/movie/store_movie_detail_use_case.dart';
import 'package:movie_app/features/detail/domain/usecases/tvshow/get_local_tvshow_detail_use_case.dart';
import 'package:movie_app/features/detail/domain/usecases/tvshow/get_remote_tvshow_detail_use_case.dart';
import 'package:movie_app/features/detail/domain/usecases/tvshow/store_local_tvshow_detail_use_case.dart';
import 'package:movie_app/features/list/data/datasources/favorite_list_data_source.dart';
import 'package:movie_app/features/list/data/repositories/favorite_list_repository_impl.dart';
import 'package:movie_app/features/list/domain/repositories/favorite_list_repository.dart';
import 'package:movie_app/features/list/domain/usecases/add_content_to_list_use_case.dart';
import 'package:movie_app/features/list/domain/usecases/create_favorite_list_use_case.dart';
import 'package:movie_app/features/list/domain/usecases/delete_favorite_list_use_case.dart';
import 'package:movie_app/features/list/domain/usecases/edit_list_name_use_case.dart';
import 'package:movie_app/features/list/domain/usecases/get_favorites_list_use_case.dart';
import 'package:movie_app/features/list/domain/usecases/remove_content_from_list_use_case.dart';
import 'package:movie_app/features/login/data/datasources/authentication_remote_data_source.dart';
import 'package:movie_app/features/login/data/datasources/authentication_local_data_source.dart';
import 'package:movie_app/features/login/data/repositories/authentication_repository_impl.dart';
import 'package:movie_app/features/login/domain/repositories/authentication_repository.dart';
import 'package:movie_app/features/login/domain/usecases/create_session_use_case.dart';
import 'package:movie_app/features/login/domain/usecases/request_token_use_case.dart';
import 'package:movie_app/features/login/domain/usecases/store_token_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final SharedPreferences sharedPref = await SharedPreferences.getInstance();
  sl.registerLazySingleton<HttpService>(() => HttpService());
  sl.registerSingleton<SharedPreferences>(sharedPref);

  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSource(sl<HttpService>()));
  sl.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSource(sl<SharedPreferences>()));

  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      sl<AuthenticationRemoteDataSource>(),
      sl<AuthenticationLocalDataSource>(),
    ),
  );

  sl.registerLazySingleton<CreateSessionUseCase>(
      () => CreateSessionUseCase(sl<AuthenticationRepository>()));
  sl.registerLazySingleton<RequestTokenUseCase>(
      () => RequestTokenUseCase(sl<AuthenticationRepository>()));
  sl.registerLazySingleton<StoreTokenUseCase>(
      () => StoreTokenUseCase(sl<AuthenticationRepository>()));

  /// Content Section

  // Movies Data Sources
  sl.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSource(sl<HttpService>()));

  sl.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSource(sl<SharedPreferences>()));

  // TV Shows Data Sources
  sl.registerLazySingleton<TVShowsRemoteDataSource>(
      () => TVShowsRemoteDataSource(sl<HttpService>()));

  sl.registerLazySingleton<TVShowsLocalDataSource>(
      () => TVShowsLocalDataSource(sl<SharedPreferences>()));

  // Movies Repositories
  sl.registerLazySingleton<MoviesRemoteRepository>(
    () => MoviesRemoteRepositoryImpl(sl<MovieRemoteDataSource>()),
  );
  sl.registerLazySingleton<MoviesLocalRepository>(
    () => MoviesLocalRepositoryImpl(sl<MovieLocalDataSource>()),
  );

  // TV Shows Repositories
  sl.registerLazySingleton<TVShowsRemoteRepository>(
    () => TVShowsRemoteRepositoryImpl(sl<TVShowsRemoteDataSource>()),
  );

  sl.registerLazySingleton<TVShowsLocalRepository>(
    () => TVShowsLocalRepositoryImpl(sl<TVShowsLocalDataSource>()),
  );

  // Movies Use Cases
  sl.registerLazySingleton<GetRemoteMoviesUseCase>(
      () => GetRemoteMoviesUseCase(sl<MoviesRemoteRepository>()));

  sl.registerLazySingleton<GetLocalMoviesUseCase>(
      () => GetLocalMoviesUseCase(sl<MoviesLocalRepository>()));

  sl.registerLazySingleton<StoreMoviesUseCase>(
      () => StoreMoviesUseCase(sl<MoviesLocalRepository>()));

  sl.registerLazySingleton<SearchMoviesUseCase>(
      () => SearchMoviesUseCase(sl<MoviesRemoteRepository>()));

  // TV Shows Use Cases

  sl.registerLazySingleton<GetRemoteTVShowsUseCase>(
      () => GetRemoteTVShowsUseCase(sl<TVShowsRemoteRepository>()));

  sl.registerLazySingleton<GetLocalTVShowsUseCase>(
      () => GetLocalTVShowsUseCase(sl<TVShowsLocalRepository>()));

  sl.registerLazySingleton<StoreTVShowsUseCase>(
      () => StoreTVShowsUseCase(sl<TVShowsLocalRepository>()));

  sl.registerLazySingleton<SearchTVShowsUseCase>(
      () => SearchTVShowsUseCase(sl<TVShowsRemoteRepository>()));

  // Detail Section

  // Movie Detail Repository

  sl.registerLazySingleton<MovieDetailLocalRepository>(
      () => MovieDetailLocalRepositoryImpl(sl<MovieDetailLocalDataSource>()));

  sl.registerLazySingleton<MovieDetailRemoteRepository>(
      () => MovieDetailRemoteRepositoryImpl(sl<MovieDetailRemoteDataSource>()));

  sl.registerLazySingleton<TVShowDetailRemoteDataSource>(
      () => TVShowDetailRemoteDataSource(sl<HttpService>()));

  sl.registerLazySingleton<TVShowDetailRemoteRepository>(() =>
      TVShowDetailRemoteRepositoryImpl(sl<TVShowDetailRemoteDataSource>()));

  // Movie Detail Data Source

  sl.registerLazySingleton<MovieDetailRemoteDataSource>(
      () => MovieDetailRemoteDataSource(sl<HttpService>()));

  sl.registerLazySingleton<MovieDetailLocalDataSource>(
      () => MovieDetailLocalDataSource(sl<SharedPreferences>()));

  sl.registerLazySingleton<TVShowDetailLocalDataSource>(
      () => TVShowDetailLocalDataSource(sl<SharedPreferences>()));

  sl.registerLazySingleton<TVShowLocalDetailRepository>(
      () => TVShowLocalDetailRepositoryImpl(sl<TVShowDetailLocalDataSource>()));

  sl.registerLazySingleton<GetRemoteMovieDetailUseCase>(
      () => GetRemoteMovieDetailUseCase(sl<MovieDetailRemoteRepository>()));

  sl.registerLazySingleton<GetRemoteTVShowDetailUseCase>(
      () => GetRemoteTVShowDetailUseCase(sl<TVShowDetailRemoteRepository>()));

  sl.registerLazySingleton<GetLocalMovieDetailUseCase>(
      () => GetLocalMovieDetailUseCase(sl<MovieDetailLocalRepository>()));

  sl.registerLazySingleton<GetLocalTVShowDetailUseCase>(
      () => GetLocalTVShowDetailUseCase(sl<TVShowLocalDetailRepository>()));

  sl.registerLazySingleton<StoreLocalTVShowDetailUseCase>(
      () => StoreLocalTVShowDetailUseCase(sl<TVShowLocalDetailRepository>()));

  sl.registerLazySingleton<StoreMovieDetailUseCase>(
      () => StoreMovieDetailUseCase(sl<MovieDetailLocalRepository>()));

  // Favorites Section

  sl.registerLazySingleton<FavoriteListDataSource>(
    () => FavoriteListDataSource(sl<SharedPreferences>()),
  );

  sl.registerLazySingleton<FavoriteListRepository>(
    () => FavoriteListRepositoryImpl(sl<FavoriteListDataSource>()),
  );

  sl.registerLazySingleton<CreateFavoriteListUseCase>(
    () => CreateFavoriteListUseCase(sl<FavoriteListRepository>()),
  );

  sl.registerLazySingleton<GetFavoritesListUseCase>(
    () => GetFavoritesListUseCase(sl<FavoriteListRepository>()),
  );

  sl.registerLazySingleton<DeleteFavoriteListUseCase>(
    () => DeleteFavoriteListUseCase(sl<FavoriteListRepository>()),
  );

  sl.registerLazySingleton<AddContentToListUseCase>(
    () => AddContentToListUseCase(sl<FavoriteListRepository>()),
  );

  sl.registerLazySingleton<RemoveContentFromListUseCase>(
    () => RemoveContentFromListUseCase(sl<FavoriteListRepository>()),
  );
  sl.registerLazySingleton<EditListNameUseCase>(
    () => EditListNameUseCase(sl<FavoriteListRepository>()),
  );
}
