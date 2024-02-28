import 'package:flutter/material.dart';
import 'package:mood_occurrences/core/constants/app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  Color _themeColor = AppColors.redColor; // Default theme color

  Color get themeColor => _themeColor;

  void setThemeColor(Color color) {
    _themeColor = color;
    notifyListeners();
  }
}
