import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({bool darkMode = false}) : super(ThemeState(isDarkMode: darkMode));

  void toggleTheme(){
    emit(ThemeState(isDarkMode: !state.isDarkMode));
  }

  void SetDarkMode(bool darkMode){
    emit(const ThemeState(isDarkMode: true));
  }

  void SetLightMode(bool lightMode){
    emit(const ThemeState(isDarkMode: false));
  }
}

