import 'package:flutter/material.dart';
import 'package:todo_list_test/core/constants/app_colors.dart';

ThemeData darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "satoshi",
    bottomSheetTheme: const BottomSheetThemeData(
      dragHandleColor: Color(0xff333333),
      backgroundColor: Color(0xff141414),
      surfaceTintColor: Colors.transparent,
    ),
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.light(
        brightness: Brightness.dark,
        background: Color(0xFF1A1617),
        primary: Color(0xFFFE6008),
        secondary: AppColors.textSecondaryDark,
        inversePrimary: AppColors.textPrimaryDark,
        inverseSurface: Color(0xff282828)),
    textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: AppColors.textPrimaryDark, displayColor: Colors.black),
  );
}
