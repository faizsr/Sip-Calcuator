import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sip_calculator/core/constants/appcolors.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Outfit',
  scaffoldBackgroundColor: AppColors.lTan,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  splashFactory: NoSplash.splashFactory,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.lDarkPurple,
    onPrimary: AppColors.lDarkPurple,
    secondary: AppColors.lDarkPurple,
    onSecondary: AppColors.lDarkPurple,
    error: AppColors.lDarkPurple,
    onError: AppColors.lDarkPurple,
    surface: AppColors.lDarkPurple,
    onSurface: AppColors.lDarkPurple,
  ),
);

void mySystemTheme(BuildContext context) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.lTan,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.lTan,
    ),
  );
}
