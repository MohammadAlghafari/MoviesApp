part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
}

class ThemeChanged extends ThemeEvent {
  final AppTheme theme;

  ThemeChanged({
    required this.theme,
  });
  
  @override
  List<Object?> get props => [theme];
}
