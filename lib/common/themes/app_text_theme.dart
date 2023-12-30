import 'package:flutter/material.dart';

abstract class TaskGenieTextTheme{
  static TextTheme taskGenieTextTheme(Color textColor){
    return TextTheme(
      //Task Text
      displayMedium: TextStyle(
        fontSize: 20,
        color: textColor,
      ),

      //AppName
      titleLarge: TextStyle(
          color: textColor,
          fontSize: 50.0,
          fontWeight: FontWeight.w700
      ),

      //Add screen prompt
      titleMedium: TextStyle(
        color: textColor,
        fontSize: 30,
      ),

      //Add button prompt
      labelMedium: TextStyle(
          color: textColor,
          fontSize: 18,
        fontWeight: FontWeight.w800,
      ),

      //snackbar promt
      labelSmall: TextStyle(
        color: textColor,
        fontSize: 16,
      )
    );
  }
}