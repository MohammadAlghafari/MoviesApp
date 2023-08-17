
class ApiConstants {
  static const String apiKey = 'bbf250dec2e1aa8e3a4a6ab17ed91332';
  static const String baseUrl = 'https://api.themoviedb.org/3';

  static const String baseBackdropUrl = 'https://image.tmdb.org/t/p/w1280';
  static const String basePosterUrl = 'https://image.tmdb.org/t/p/w500';
  static const String baseProfileUrl = 'https://image.tmdb.org/t/p/w300';
  static const String baseVideoUrl = 'https://www.youtube.com/watch?v=';

  static const String moviePlaceHolder =
      'https://davidkoepp.com/wp-content/themes/blankslate/images/Movie%20Placeholder.jpg';

  static const String castPlaceHolder =
      'https://palmbayprep.org/wp-content/uploads/2015/09/user-icon-placeholder.png';

  // movies paths
  static const String nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';

  static const String popularMoviesPath =
      '$baseUrl/movie/popular?api_key=$apiKey';

  static const String topRatedMoviesPath =
      '$baseUrl/movie/top_rated?api_key=$apiKey';

  static String getMovieDetailsPath(int movieId) {
    return '$baseUrl/movie/$movieId?api_key=$apiKey&append_to_response=videos,credits,reviews,similar';
  }

  static String getAllPopularMoviesPath(int page) {
    return '$baseUrl/movie/popular?api_key=$apiKey&page=$page';
  }

  static String getAllTopRatedMoviesPath(int page) {
    return '$baseUrl/movie/top_rated?api_key=$apiKey&page=$page';
  }

  // search paths
  static String getSearchPath(String title) {
    return '$baseUrl/search/movie?api_key=$apiKey&query=$title';
  }
}
