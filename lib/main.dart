import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/core/domain/entities/media.dart';
import 'package:movies_app/core/resources/app_router.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/core/resources/app_strings.dart';
import 'package:movies_app/favorites/presentation/controllers/favorites_list_bloc/favorites_list_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/theme_bloc/theme_bloc.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MediaAdapter());
  await Hive.openBox('items');
  ServiceLocator.init();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<FavoritesListBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<ThemeBloc>(),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: AppStrings.appTitle,
              theme: state.themeData,
              routerConfig: AppRouter().router,
            );
          },
        ));
  }
}
