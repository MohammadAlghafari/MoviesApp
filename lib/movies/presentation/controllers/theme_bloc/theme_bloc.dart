import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/resources/app_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(
            themeData: appThemeData[AppTheme.darkTheme]!,
            appTheme: AppTheme.darkTheme)) {
    on<ThemeChanged>((event, emit) {
      emit(
        ThemeState(
            themeData: appThemeData[event.theme]!, appTheme: event.theme),
      );
    });
  }
}
