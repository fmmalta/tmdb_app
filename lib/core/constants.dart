// ignore_for_file: constant_identifier_names

const String BASE_URL = 'https://api.themoviedb.org/3';
const String BASE_IMAGE_URL = 'https://image.tmdb.org/t/p/w185';
const String REQUEST_TOKEN_PATH = '/authentication/token/new';
const String VALIDATE_WITH_LOGIN = '/authentication/token/validate_with_login';
const String MOVIES_NOW_PLAYING_PATH =
    '/movie/now_playing?language=pt-BR&page=1';
const String TVSHOWS_POPULAR_PATH = '/tv/top_rated?language=pt-BR&page=1';
const String API_KEY = 'xxxx';
String movieDetailPath(int id) => '/movie/$id?language=pt-BR';
String tvShowDetailPath(int id) => '/tv/$id?language=pt-BR';
String movieSearchPath(String query) =>
    '/search/movie?query=$query&include_adult=false&language=pt-BR&page=1';
String tvShowSearchPath(String query) =>
    '/search/tv?query=$query&include_adult=false&language=pt-BR&page=1';
const String TOKEN = 'Bearer xxxx';
