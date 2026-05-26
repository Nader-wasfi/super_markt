import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.mainGreen,
      scaffoldBackgroundColor: AppColors.white,
    );
  }
}