import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartcue/config/color/colors.dart';

class ThemeCubit extends Cubit<ThemeData> {
  final String _themeKey = 'isDarkTheme';
  bool _isDarkTheme = false;

  ThemeCubit() : super(_lightTheme) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkTheme = prefs.getBool(_themeKey) ?? false;
    emit(_isDarkTheme ? _darkTheme : _lightTheme);
  }

  Future<void> toggleTheme() async {
    _isDarkTheme = !_isDarkTheme;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, _isDarkTheme);
    emit(_isDarkTheme ? _darkTheme : _lightTheme);
  }

  // Define light theme
  static final ThemeData _lightTheme = ThemeData(
    primaryColor: AppColors.lightPrimary,
    primaryColorLight: Colors.white,
    primaryColorDark: Colors.black,
    brightness: Brightness.light,
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.lightPrimary,
        onPrimary: Colors.black,
        secondary: AppColors.lightGreyBlack,
        onSecondary: AppColors.lightGreyMedium,
        error: Colors.red,
        onError: Colors.white,
        surface: AppColors.greylight400,
        onSurface: Colors.black),
    scaffoldBackgroundColor: AppColors.lightGreyBlack,
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: AppColors.lightGreyBlack),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightGreyMedium,
    ),
  );

  // Define dark theme
  static final ThemeData _darkTheme = ThemeData(
    primaryColor: AppColors.darkPrimary,
    primaryColorLight: Colors.black,
    primaryColorDark: Colors.white,
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.darkPrimary,
        onPrimary: Colors.white,
        secondary: AppColors.darkGreyBlack,
        onSecondary: AppColors.darkGreyMedium,
        error: Colors.red,
        onError: Colors.white,
        surface: AppColors.greydark800,
        onSurface: Colors.black),
    scaffoldBackgroundColor: AppColors.darkGreyBlack,
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: AppColors.darkGreyBlack),
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.greydark800,
    ),
  );
}
