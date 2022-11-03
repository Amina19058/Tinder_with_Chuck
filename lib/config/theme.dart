import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      primaryColor: const Color(0xFF0C0916),
      primaryColorDark: const Color(0xFF020107),
      primaryColorLight: const Color(0xE0FCFCFD), //(0xFF211E2C)
      scaffoldBackgroundColor: const Color(0xF1100D27),
      backgroundColor: const Color(0xF5ABAFCC),
      appBarTheme: const AppBarTheme(
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        )),
        backgroundColor: Color(0xF5ABAFCC),
      ),
      textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0xE0FCFCFD),
            fontFamily: 'NunitoSans',
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
          headline2: TextStyle(
            color: Color(0xE0FCFCFD),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          bodyText1: TextStyle(
            color: Color(0xAB0E1523),
            fontFamily: 'GothamRounded',
            fontWeight: FontWeight.normal,
            fontSize: 24,
            shadows: [
              Shadow(
                blurRadius: 80.0,
                color: Color(0xB6AFAFAF),
                offset: Offset(3.0, 3.0),
              ),
              Shadow(
                color: Colors.black12,
                blurRadius: 80.0,
                offset: Offset(-3.0, 3.0),
              ),
            ],
          ),
          bodyText2: TextStyle(
            color: Color(0xAB0E1523),
            fontFamily: 'GothamRounded',
            fontWeight: FontWeight.normal,
            fontSize: 16,
            shadows: [
              Shadow(
                blurRadius: 80.0,
                color: Color(0xB6AFAFAF),
                offset: Offset(3.0, 3.0),
              ),
              Shadow(
                color: Colors.black12,
                blurRadius: 80.0,
                offset: Offset(-3.0, 3.0),
              ),
            ],
          )));
}
