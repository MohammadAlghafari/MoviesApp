part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;
  final AppTheme appTheme;

  const ThemeState({
    required this.themeData,
    required this.appTheme,
  });

  @override
  List<Object?> get props => [themeData, appTheme];
}
