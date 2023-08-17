import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/resources/app_router.dart';
import 'package:movies_app/core/resources/app_strings.dart';

import 'package:movies_app/core/resources/app_routes.dart';
import 'package:movies_app/core/resources/app_values.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          final String location = GoRouterState.of(context).location;
          if (!location.startsWith(moviesPath)) {
            _onItemTapped(0, context);
          }
          return true;
        },
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: AppStrings.movies,
            icon: Icon(
              Icons.movie_creation_rounded,
              size: AppSize.s20,
            ),
          ),
          BottomNavigationBarItem(
            label: AppStrings.search,
            icon: Icon(
              Icons.search_rounded,
              size: AppSize.s20,
            ),
          ),
          BottomNavigationBarItem(
            label: AppStrings.favorites,
            icon: Icon(
              Icons.favorite,
              size: AppSize.s20,
            ),
          ),
        ],
        currentIndex: _getSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
      ),
    );
  }

  int _getSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(moviesPath)) {
      return 0;
    }
    if (location.startsWith(searchPath)) {
      return 1;
    }
    if (location.startsWith(favoritesListPath)) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.goNamed(AppRoutes.moviesRoute);
        break;
      case 1:
        context.goNamed(AppRoutes.searchRoute);
        break;
      case 2:
        context.goNamed(AppRoutes.favoritesListRoute);
        break;
    }
  }
}
