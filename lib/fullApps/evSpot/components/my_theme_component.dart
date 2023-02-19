import 'package:prokit_flutter/fullApps/evSpot/utils/colors.dart';
import 'package:prokit_flutter/fullApps/evSpot/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: ev_primary_color,
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFF5DFFA1),
      onPrimaryContainer: Color(0xFF00210E),
      secondary: Color(0xFF4F6353),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFD2E8D4),
      onSecondaryContainer: Color(0xFF0D1F13),
      tertiary: Color(0xFF006B5D),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFF76F8E0),
      onTertiaryContainer: Color(0xFF00201B),
      error: Color(0xFFBA1A1A),
      errorContainer: Color(0xFFFFDAD6),
      onError: Color(0xFFFFFFFF),
      onErrorContainer: Color(0xFF410002),
      background: Color(0xFFFBFDF8),
      onBackground: Color(0xFF191C19),
      surface: Color(0xFFFBFDF8),
      onSurface: Color(0xFF191C19),
      surfaceVariant: Color(0xFFDDE5DB),
      onSurfaceVariant: Color(0xFF414942),
      outline: Color(0xFF717971),
      onInverseSurface: Color(0xFFF0F1EC),
      inverseSurface: Color(0xFF2E312E),
      inversePrimary: Color(0xFF37E187),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFF006D3B),
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
    ),
    dividerColor: Colors.transparent,
    dividerTheme: DividerThemeData(space: 32, thickness: 1, color: dividerColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ev_primary_color),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(DEFAULT_RADIUS))),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: ev_primary_color,
      onPrimary: Color(0xFF00391C),
      primaryContainer: Color(0xFF00522B),
      onPrimaryContainer: Color(0xFF5DFFA1),
      secondary: Color(0xFFB6CCB9),
      onSecondary: Color(0xFF223527),
      secondaryContainer: Color(0xFF384B3C),
      onSecondaryContainer: Color(0xFFD2E8D4),
      tertiary: Color(0xFF56DBC5),
      onTertiary: Color(0xFF003730),
      tertiaryContainer: Color(0xFF005046),
      onTertiaryContainer: Color(0xFF76F8E0),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
      onError: Color(0xFF690005),
      onErrorContainer: Color(0xFFFFDAD6),
      background: Color(0xFF191C19),
      onBackground: Color(0xFFE1E3DE),
      surface: Color(0xFF191C19),
      onSurface: Color(0xFFE1E3DE),
      surfaceVariant: Color(0xFF414942),
      onSurfaceVariant: Color(0xFFC0C9BF),
      outline: Color(0xFF8B938A),
      onInverseSurface: Color(0xFF191C19),
      inverseSurface: Color(0xFFE1E3DE),
      inversePrimary: Color(0xFF006D3B),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFF37E187),
    ),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black, statusBarIconBrightness: Brightness.light),
    ),
    dividerColor: Colors.transparent,
    dividerTheme: DividerThemeData(space: 32, thickness: 1, color: dividerBlackColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(DEFAULT_RADIUS))),
      ),
    ),
  );
}
