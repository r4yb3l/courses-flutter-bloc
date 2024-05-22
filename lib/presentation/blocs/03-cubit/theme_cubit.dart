import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({bool darkMode = false}) : super(ThemeState(isDarkMode: darkMode));

  void toggleTheme(){
    emit(ThemeState(isDarkMode: !state.isDarkMode));
  }

  void SetDarkMode(){
    emit(const ThemeState(isDarkMode: true));
  }

  void SetLightMode(){
    emit(const ThemeState(isDarkMode: false));
  }
}

