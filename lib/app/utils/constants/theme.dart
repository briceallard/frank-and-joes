import 'package:flutter/material.dart';

class CustomColors {
  static const Color teal = Color(0xFF69CCD0);
  static const Color greenTeal = Color(0xFF99CCCC);
  static const Color darkTeal = Color(0xFF164040);
  static const Color lightBlue = Color(0xFF236E8C);
  static const Color orange = Color(0xFFF2A03D);
  static const Color white = Color(0xFFFFFFFF);
}

class CustomTheme {
  ThemeData themeData = ThemeData(
    fontFamily: 'Montserrat',
    brightness: Brightness.light,
    primarySwatch: Colors.teal,
    primaryColor: CustomColors.teal,
    primaryColorBrightness: Brightness.light,
    accentColor: CustomColors.greenTeal,
    accentColorBrightness: Brightness.light,
    canvasColor: CustomColors.white,
    scaffoldBackgroundColor: CustomColors.white,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.black, fontSize: 16.0),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2.0),
      ),
    ),
  );

  TextStyle pageTitle = TextStyle(
    fontSize: 42.0,
    color: CustomColors.teal,
    fontFamily: 'Merriweather',
    fontWeight: FontWeight.w600,
    shadows: <Shadow>[
      Shadow(
        color: Colors.grey,
        blurRadius: 3.0,
        offset: Offset(0.0, 2.0),
      )
    ],
  );

  TextStyle appBarText = TextStyle(
    fontSize: 20.0,
    color: Colors.black,
    fontFamily: 'Merriweather',
    fontWeight: FontWeight.w600,
    shadows: <Shadow>[
      Shadow(
        color: Colors.grey,
        blurRadius: 3.0,
        offset: Offset(0.0, 2.0),
      )
    ],
  );

  TextStyle subtitle = TextStyle(
    fontSize: 28.0,
    color: Colors.black,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
  );

  TextStyle pageDescription = TextStyle(
    fontSize: 16.0,
    color: Colors.grey,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
  );

  TextStyle regText = TextStyle(
    fontSize: 16.0,
    color: Colors.black,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
  );
}
