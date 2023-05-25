part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {
  final AppTheme theme;

  const ThemeState({required this.theme});
}

class ThemeInitial extends ThemeState {
  const ThemeInitial({required super.theme});
}

class NewTheme extends ThemeState {
  const NewTheme({required super.theme});
}
