import 'package:bloc/bloc.dart';
import 'package:dark_light_mode/enums/theme_enums.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeInitial(theme: AppTheme.light));

  void lightToDark() {
    emit(const NewTheme(theme: AppTheme.dark));
  }

  void darkToLight() {
    emit(const NewTheme(theme: AppTheme.light));
  }
}
