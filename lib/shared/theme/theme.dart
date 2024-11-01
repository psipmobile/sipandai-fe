import 'package:flutter/material.dart';
import 'package:samsat_gpt/core.dart';

ThemeData themeDataLight = ThemeData(
  useMaterial3: false,
).copyWith(
  primaryColor: primaryColor,
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    primary: Color(0xff069550),
    onPrimary: Color(0xffFFFFFF),
    background: Color(0xffF6F8FA),
    onBackground: Color(0xff212121),
    surface: Color(0xffFFFFFF),
    onSurface: Color(0xff212121),
    error: Color(0xffE53935),
    onError: Color(0xffFFFFFF),
    tertiary: Color(0xffEEEEEE),
    onTertiary: Color(0xff757575),
    secondary: Color(0xffEEEEEE),
    onSecondary: Color(0xff757575),
    outline: Color(0xffE3E7ED),
  ),
  cardColor: neutralWhite,
  scaffoldBackgroundColor: const Color(0xffF6F8FA),
  appBarTheme: AppBarTheme(
    backgroundColor: neutralWhite,
    elevation: 0,
    titleTextStyle: myTextThemeLight.titleMedium,
    iconTheme: const IconThemeData(
      color: gray800,
    ),
  ),
  textTheme: myTextThemeLight,
);

ThemeData themeDataDark = ThemeData.dark(
  useMaterial3: false,
).copyWith(
  primaryColor: primaryColor,
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    primary: Color(0xff069550),
    onPrimary: Color(0xffFFFFFF),
    background: Color(0xff111313),
    onBackground: Color(0xffE9E9E9),
    surface: Color(0xff171818),
    onSurface: Color(0xffE9E9E9),
    error: Color(0xffE53935),
    onError: Color(0xffFFFFFF),
    tertiary: Color(0xff1F2121),
    onTertiary: Color(0xff757575),
    secondary: Color(0xff292C2A),
    onSecondary: Color(0xffAAB0B7),
    outline: Color(0xff292C2A),
  ),
  cardColor: darkBackground,
  scaffoldBackgroundColor: darkBackground,
  appBarTheme: AppBarTheme(
    backgroundColor: darkBackground,
    elevation: 0,
    titleTextStyle: myTextThemeDark.titleMedium,
    iconTheme: const IconThemeData(
      color: textHigh,
    ),
  ),
  textTheme: myTextThemeDark,
);
