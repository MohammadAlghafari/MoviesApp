import 'package:get_it/get_it.dart';
import 'package:movies_app/favorites/data/datasource/favorites_local_data_source.dart';
import 'package:movies_app/favorites/data/repository/favorites_repository_impl.dart';
import 'package:movies_app/favorites/domain/repository/favorites_repository.dart';
import 'package:movies_app/favorites/domain/usecases/add_favorite_item_usecase.dart';
import 'package:movies_app/favorites/domain/usecases/check_if_item_added_usecase.dart';
import 'package:movies_app/favorites/domain/usecases/get_favorites_list_items_usecase.dart';
import 'package:movies_app/favorites/domain/usecases/remove_watchlist_item_usecase.dart';
import 'package:movies_app/favorites/presentation/controllers/favorites_list_bloc/favorites_list_bloc.dart';
import 'package:movies_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository_impl.dart';
import 'package:movies_app/movies/domain/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_all_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_all_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controllers/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/theme_bloc/theme_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/top_rated_movies_bloc/top_rated_movies_bloc.dart';
import 'package:movies_app/search/data/datasource/search_remote_data_source.dart';
import 'package:movies_app/search/data/repository/search_repository_impl.dart';
import 'package:movies_app/search/domain/repository/search_repository.dart';
import 'package:movies_app/search/domain/usecases/search_usecase.dart';
import 'package:movies_app/search/presentation/controllers/search_bloc/search_bloc.dart';

import 'package:movies_app/movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/movies_bloc/movies_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
    // Data source
    sl.registerLazySingleton<MoviesRemoteDataSource>(
        () => MoviesRemoteDataSourceImpl());
    sl.registerLazySingleton<SearchRemoteDataSource>(
        () => SearchRemoteDataSourceImpl());
    sl.registerLazySingleton<FavoritesListLocalDataSource>(
        () => FavoriteslistLocalDataSourceImpl());

    // Repository
    sl.registerLazySingleton<MoviesRepository>(
        () => MoviesRepositoryImpl(sl()));
    sl.registerLazySingleton<SearchRepository>(
        () => SearchRepositoryImpl(sl()));
    sl.registerLazySingleton<FavoritesListRepository>(
        () => FavoriteListRepositoryImpl(sl()));

    // Use Cases
    sl.registerLazySingleton(() => GetMoviesDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetAllPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetAllTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => SearchUseCase(sl()));
    sl.registerLazySingleton(() => GetFavoritesListItemsUseCase(sl()));
    sl.registerLazySingleton(() => AddFavoriteListItemUseCase(sl()));
    sl.registerLazySingleton(() => RemoveFavoriteListItemUseCase(sl()));
    sl.registerLazySingleton(() => CheckIfItemAddedUseCase(sl()));

    // Bloc
    sl.registerFactory(() => ThemeBloc());
    sl.registerFactory(() => MoviesBloc(sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl()));
    sl.registerFactory(() => PopularMoviesBloc(sl()));
    sl.registerFactory(() => TopRatedMoviesBloc(sl()));
    sl.registerFactory(() => SearchBloc(sl()));
    sl.registerFactory(() => FavoritesListBloc(sl(), sl(), sl(), sl()));
  }
}
