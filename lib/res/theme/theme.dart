import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  iconTheme: const IconThemeData(color: CustomColors.primary),
  fontFamily: 'Urbanist',

  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: CustomColors.white,
    unselectedItemColor: CustomColors.grey,
    selectedItemColor: CustomColors.white,
  ),
  splashColor: CustomColors.white.withValues(alpha: .5),
  highlightColor: CustomColors.white.withValues(alpha: .5),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: CustomColors.primary,
    selectionColor: CustomColors.primary,
    selectionHandleColor: CustomColors.white,
  ),
  colorScheme: ColorScheme.fromSwatch(accentColor: CustomColors.primary),
  checkboxTheme: CheckboxThemeData(side: BorderSide(color: CustomColors.white)),
  listTileTheme: ListTileThemeData(
    shape: RoundedRectangleBorder(
      side: BorderSide(color: CustomColors.grey),
      borderRadius: BorderRadius.circular(5),
    ),
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(CustomColors.primary),
    ),
  ),
  dividerColor: CustomColors.grey,
  appBarTheme: AppBarTheme(
    color: CustomColors.black,
    elevation: 0,
    foregroundColor: CustomColors.white,
  ),
  scaffoldBackgroundColor: CustomColors.black,
  primaryColor: CustomColors.primary,
  primaryColorLight: CustomColors.primary.withValues(alpha: .5),
  brightness: Brightness.light,
  hintColor: CustomColors.grey,
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(
      CustomColors.primary.withValues(alpha: .8),
    ),
    trackColor: WidgetStateProperty.all(
      CustomColors.primary.withValues(alpha: .1),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      fixedSize: const WidgetStatePropertyAll<Size>(Size(999, 50)),
      backgroundColor: const WidgetStatePropertyAll(CustomColors.primary),
      padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
    ),
  ),
  textTheme: TextTheme(
    // Main Heading
    displayLarge: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w700,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),
    // Sub Heading
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),
    // Section Heading
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),

    // Card Titles
    headlineLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),

    // Bold Titles
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),

    // Main body text
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),

    // Buttons
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: CustomColors.white,
      fontFamily: 'Urbanist',
    ),
  ),
);

ThemeData lightTheme = ThemeData(
  primaryColor: CustomColors.primary,
  scaffoldBackgroundColor: CustomColors.primaryScreenColor,
  // scaffoldBackgroundColor: CustomColors.white,
  fontFamily: 'Urbanist',
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: CustomColors.primary,
    behavior: SnackBarBehavior.fixed,
  ),

  bottomSheetTheme: const BottomSheetThemeData(
    dragHandleColor: Colors.grey,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: CustomColors.white,
    unselectedItemColor: CustomColors.grey,
    selectedItemColor: CustomColors.white,
  ),
  splashColor: CustomColors.white.withValues(alpha: .5),
  highlightColor: CustomColors.white.withValues(alpha: .5),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: CustomColors.primary,
    selectionColor: CustomColors.primary,
    selectionHandleColor: CustomColors.white,
  ),
  colorScheme: ColorScheme.fromSwatch(
    accentColor: CustomColors.primary,
    // primarySwatch: CustomColors.primary
  ),
  listTileTheme: ListTileThemeData(
    shape: RoundedRectangleBorder(
      side: BorderSide(color: CustomColors.grey),
      borderRadius: BorderRadius.circular(5),
    ),
  ),
  dividerColor: CustomColors.grey,
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(CustomColors.primary),
    ),
  ),
  appBarTheme: AppBarTheme(
    color: CustomColors.white,
    elevation: 0,
    foregroundColor: CustomColors.black,
  ),
  primaryColorLight: CustomColors.primary.withValues(alpha: .5),
  brightness: Brightness.light,
  hintColor: CustomColors.grey,
  // switchTheme: SwitchThemeData(
  //     thumbColor: WidgetStateProperty.all(CustomColors.primary.withValues(.5)),
  //     trackColor: WidgetStateProperty.all(CustomColors.bg)),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      fixedSize: const WidgetStatePropertyAll<Size>(Size(999, 40)),
      backgroundColor: const WidgetStatePropertyAll(CustomColors.primary),
      padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
    ),
  ),
  textTheme: const TextTheme(
    // Main Heading
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Urbanist',
    ),
    // Sub Heading
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Urbanist',
    ),
    // Section Heading
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Urbanist',
    ),

    // Card Titles
    headlineLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Urbanist',
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Urbanist',
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Urbanist',
    ),

    // Bold Titles
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Urbanist',
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Urbanist',
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Urbanist',
    ),

    // Main body text
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Urbanist',
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Urbanist',
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Urbanist',
    ),

    // Buttons
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Urbanist',
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Urbanist',
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: CustomColors.primaryTextColor,
      fontFamily: 'Urbanist',
    ),
  ),
);

class CustomColors {
  static const Color primary = Color(0xFFFCCE00);
  static const Color primaryTextColor = Color(0xFF927f71);
  static const Color secondaryTextColor = Color(0xFF57616A);
  static const Color buttonColor = Color(0xFF715842);
  static const Color bodyTextColor = Color(0xFFE4E6E8);
  static const Color bodyGrey = Color(0xFFEFF0F1);
  static const Color textFieldHintColor = Color(0xFF99A2AB);
  static const Color textFieldFillColor = Color(0xFFF4F5F6);
  static const Color navBarColor = Color(0xFFFFFFFF);
  static const Color primaryScreenColor = Color(0xFFEFF0F2);
  static const Color gradientTop = Color(0xFFFFDBCE);
  static const Color gradientMiddle = Color(0xFFFED5C2);
  static const Color gradientBottom = Color(0xFFFF79A0);
  static const Color red = Color(0xFFEA4335);
  static const Color green = Color(0xFF2CBD53);
  static const Color blue = Color(0xFF4285F4);
  static const Color lightBlue = Color(0xFFE1EBFF);
  static const Color lightOrange = Color(0xFFFFA216);
  static const Color lightGreen = Color(0xFF07A279);
  static const Color purple = Color(0xFF958CFE);
  static const Color lightPurple = Color(0xFFEEE1FF);
  static Color black = Colors.black;
  static Color white = Colors.white;
  static Color grey = Colors.grey;
  static const Color errorMessageColor = Color.fromARGB(255, 166, 4, 4);
  static const Color warningMessageColor = Color(0xFFC2AF6F);
  static Color success = const Color(0xFF5fa777);
  static Color greenColor = const Color(0xFFDBF7E6);
  static Color checkBoxGreen = const Color(0xff07a27a);
  static Color cardColor = const Color(0xffF7F8F9);
}
