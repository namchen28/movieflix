import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
      bodyLarge: GoogleFonts.aBeeZee(
          color: CupertinoColors.black,
          fontSize: 24,
          fontWeight: FontWeight.w500),
      titleLarge: GoogleFonts.nunito(
        color: CupertinoColors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.nunito(
        color: CupertinoColors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.nunito(
        color: CupertinoColors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: GoogleFonts.nunito(
        color: CupertinoColors.black,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: GoogleFonts.nunito(
        color: CupertinoColors.black,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      )),
  bottomSheetTheme:
      const BottomSheetThemeData(backgroundColor: CupertinoColors.white),
  scaffoldBackgroundColor: CupertinoColors.systemGrey5,
  appBarTheme: const AppBarTheme(backgroundColor: CupertinoColors.systemGrey4),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: CupertinoColors.white,
      selectedItemColor: CupertinoColors.destructiveRed,
      selectedLabelStyle: TextStyle(color: CupertinoColors.destructiveRed),
      unselectedItemColor: CupertinoColors.systemGrey2,
      unselectedLabelStyle: TextStyle(color: CupertinoColors.systemGrey2)),
  useMaterial3: true,
  colorScheme: lightColorScheme,
);

ThemeData darkTheme = ThemeData(
  textTheme: TextTheme(
      titleSmall: GoogleFonts.nunito(
        color: CupertinoColors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.aBeeZee(
          color: CupertinoColors.white,
          fontSize: 24,
          fontWeight: FontWeight.w500),
      titleLarge: GoogleFonts.nunito(
        color: CupertinoColors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.nunito(
        color: CupertinoColors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.nunito(
        color: CupertinoColors.white,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: GoogleFonts.nunito(
        color: CupertinoColors.white,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      )),
  bottomSheetTheme:
      const BottomSheetThemeData(backgroundColor: CupertinoColors.systemGrey),
  scaffoldBackgroundColor: CupertinoColors.black,
  appBarTheme:
      const AppBarTheme(backgroundColor: CupertinoColors.darkBackgroundGray),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: CupertinoColors.darkBackgroundGray,
      selectedItemColor: CupertinoColors.destructiveRed,
      selectedLabelStyle: TextStyle(color: CupertinoColors.destructiveRed),
      unselectedItemColor: CupertinoColors.systemGrey5,
      unselectedLabelStyle: TextStyle(color: CupertinoColors.systemGrey5)),
  colorScheme: darkColorScheme,
  useMaterial3: true,
);

const lightColorScheme = ColorScheme.light(
  brightness: Brightness.light,
  primary: Color.fromARGB(255, 217, 12, 12),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color.fromARGB(255, 255, 255, 255),
  onPrimaryContainer: Color(0xFF21005D),
  secondary: Color(0xFF625B71),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: CupertinoColors.extraLightBackgroundGray,
  onSecondaryContainer: Color(0xFF1D192B),
  tertiary: Color.fromARGB(255, 131, 15, 54),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFD8E4),
  onTertiaryContainer: Color(0xFF31111D),
  error: Color(0xFFB3261E),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFF9DEDC),
  onErrorContainer: Color(0xFF410E0B),
  outline: Color(0xFF79747E),
  background: Color(0xFFFFFBFE),
  onBackground: Color.fromARGB(255, 71, 23, 215),
  surface: Color(0xFFFFFBFE),
  onSurface: Color(0xFF1C1B1F),
  surfaceVariant: Color(0xFFE7E0EC),
  onSurfaceVariant: Color(0xFF49454F),
  inverseSurface: Color(0xFF313033),
  onInverseSurface: Color(0xFFF4EFF4),
  inversePrimary: Color(0xFFD0BCFF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF6750A4),
  outlineVariant: Color(0xFFCAC4D0),
  scrim: Color.fromARGB(255, 196, 68, 68),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color.fromARGB(255, 255, 255, 255),
  onPrimary: Color(0xFF381E72),
  primaryContainer: CupertinoColors.systemGrey6,
  onPrimaryContainer: Color(0xFFEADDFF),
  secondary: Color.fromARGB(255, 255, 255, 255),
  onSecondary: Color(0xFF332D41),
  secondaryContainer: CupertinoColors.systemGrey2,
  onSecondaryContainer: Color(0xFFE8DEF8),
  tertiary: Color.fromARGB(255, 109, 44, 62),
  onTertiary: Color(0xFF492532),
  tertiaryContainer: Color(0xFF633B48),
  onTertiaryContainer: Color(0xFFFFD8E4),
  error: Color(0xFFF2B8B5),
  onError: Color(0xFF601410),
  errorContainer: Color(0xFF8C1D18),
  onErrorContainer: Color(0xFFF9DEDC),
  outline: Color(0xFF938F99),
  background: Color(0xFF1C1B1F),
  onBackground: Color(0xFFE6E1E5),
  surface: Color(0xFF1C1B1F),
  onSurface: Color(0xFFE6E1E5),
  surfaceVariant: Color(0xFF49454F),
  onSurfaceVariant: Color(0xFFCAC4D0),
  inverseSurface: Color(0xFFE6E1E5),
  onInverseSurface: Color(0xFF313033),
  inversePrimary: Color(0xFF6750A4),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFD0BCFF),
  outlineVariant: Color(0xFF49454F),
  scrim: Color(0xFF000000),
);
