import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
class DeliveryColors {
  static final purple = Color(0xFF5117AC);
  static final green = Color(0xFF20D0C4);
  static final dark = Color(0xFF03091E);
  static final grey = Color(0xFF212738);
  static final lightGrey = Color(0xFFBBBBBB);
  static final veryLightGrey = Color(0xFFF3F3F3);
  static final white = Color(0xFFFFFFFF);
  static final pink = Color(0xFFF5638B);
}

final deliveryGradients = [
  DeliveryColors.green,
  DeliveryColors.purple,
];

// Theme
final _borderLight = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5.0),
  borderSide: BorderSide(
    color: DeliveryColors.veryLightGrey,
    width: 2,
    style: BorderStyle.solid,
  ),
);
final _borderDark = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5.0),
  borderSide: BorderSide(
    color: DeliveryColors.grey,
    width: 2,
    style: BorderStyle.solid,
  ),
);

// Fonts theme
final lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: DeliveryColors.white,
    textTheme: GoogleFonts.poppinsTextTheme()
        .apply(
          bodyColor: DeliveryColors.purple,
        )
        .copyWith(
          headline6: TextStyle(
            fontSize: 20.0,
            color: DeliveryColors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
  ),
  canvasColor: DeliveryColors.white,
  accentColor: DeliveryColors.purple,
  bottomAppBarColor: DeliveryColors.veryLightGrey,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: DeliveryColors.purple,
    displayColor: DeliveryColors.purple,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: _borderLight,
    enabledBorder: _borderLight,
    focusedBorder: _borderLight,
    contentPadding: EdgeInsets.zero,
    labelStyle: TextStyle(color: DeliveryColors.purple),
    hintStyle: GoogleFonts.poppins(
      color: DeliveryColors.lightGrey,
      fontSize: 14.0,
    ),
  ),
  iconTheme: IconThemeData(
    color: DeliveryColors.purple,
  ),
);

final darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: DeliveryColors.purple,
    textTheme: GoogleFonts.poppinsTextTheme()
        .apply(
          bodyColor: DeliveryColors.purple,
        )
        .copyWith(
          headline6: TextStyle(
            fontSize: 20.0,
            color: DeliveryColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
  ),
  canvasColor: DeliveryColors.grey,
  accentColor: DeliveryColors.white,
  scaffoldBackgroundColor: DeliveryColors.dark,
  bottomAppBarColor: Colors.transparent,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: DeliveryColors.green,
    displayColor: DeliveryColors.green,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: _borderDark,
    enabledBorder: _borderDark,
    focusedBorder: _borderDark,
    fillColor: DeliveryColors.grey,
    filled: true,
    contentPadding: EdgeInsets.zero,
    labelStyle: TextStyle(color: DeliveryColors.white),
    hintStyle: GoogleFonts.poppins(
      color: DeliveryColors.white,
      fontSize: 14.0,
    ),
  ),
  iconTheme: IconThemeData(
    color: DeliveryColors.white,
  ),
);
