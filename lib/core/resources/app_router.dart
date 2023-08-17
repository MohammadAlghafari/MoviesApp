import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/presentation/pages/main_page.dart';
import 'package:movies_app/favorites/presentation/views/favorites_list_view.dart';
import 'package:movies_app/movies/presentation/views/movie_details_view.dart';
import 'package:movies_app/movies/presentation/views/movies_view.dart';
import 'package:movies_app/movies/presentation/views/popular_movies_view.dart';
import 'package:movies_app/movies/presentation/views/top_rated_movies_view.dart';
import 'package:movies_app/search/presentation/views/search_view.dart';

import 'package:movies_app/core/resources/app_routes.dart';

const String moviesPath = '/movies';
const String movieDetailsPath = 'movieDetails/:movieId';
const String popularMoviesPath = 'popularMovies';
const String topRatedMoviesPath = 'topRatedMovies';
const String searchPath = '/search';
const String favoritesListPath = '/favoritesList';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: moviesPath,
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainPage(child: child),
        routes: [
          GoRoute(
            name: AppRoutes.moviesRoute,
            path: moviesPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: MoviesView(),
            ),
            routes: [
              GoRoute(
                name: AppRoutes.movieDetailsRoute,
                path: movieDetailsPath,
                pageBuilder: (context, state) => CupertinoPage(
                  child: MovieDetailsView(
                    movieId: int.parse(state.params['movieId']!),
                  ),
                ),
              ),
              GoRoute(
                name: AppRoutes.popularMoviesRoute,
                path: popularMoviesPath,
                pageBuilder: (context, state) => const CupertinoPage(
                  child: PopularMoviesView(),
                ),
              ),
              GoRoute(
                name: AppRoutes.topRatedMoviesRoute,
                path: topRatedMoviesPath,
                pageBuilder: (context, state) => const CupertinoPage(
                  child: TopRatedMoviesView(),
                ),
              ),
            ],
          ),
          GoRoute(
            name: AppRoutes.searchRoute,
            path: searchPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SearchView(),
            ),
          ),
          GoRoute(
            name: AppRoutes.favoritesListRoute,
            path: favoritesListPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: FavoritesListView(),
            ),
          ),
        ],
      )
    ],
  );
}
