import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sip_calculator/core/constants/colors.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Outfit',
  scaffoldBackgroundColor: lTan,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  splashFactory: NoSplash.splashFactory,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: lDarkPurple,
    onPrimary: lDarkPurple,
    secondary: lDarkPurple,
    onSecondary: lDarkPurple,
    error: lDarkPurple,
    onError: lDarkPurple,
    surface: lDarkPurple,
    onSurface: lDarkPurple,
  ),
);

void mySystemTheme(BuildContext context) {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: lTan,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: lTan,
    ),
  );
}
