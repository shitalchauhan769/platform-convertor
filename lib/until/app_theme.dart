import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'color.dart';
ThemeData lightTheme = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Primary),
    brightness: Brightness.light,
    colorSchemeSeed: Primary,
    textTheme: const TextTheme(
        titleLarge: TextStyle()),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Primary),
          textStyle:MaterialStateProperty.all(
            TextStyle(color: Colors.white),
          ),
          foregroundColor: MaterialStateProperty.all(Colors.black),
        )));
ThemeData darkTheme = ThemeData(




    floatingActionButtonTheme:
    FloatingActionButtonThemeData(backgroundColor: Primary),
    brightness: Brightness.dark,



    textTheme: const TextTheme(
        titleLarge: TextStyle()),




    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(

            textStyle: MaterialStateProperty.all(
              TextStyle(color: Colors.white),
            ),
            foregroundColor:MaterialStateProperty.all(
              Colors.white,

            ))));

CupertinoThemeData light=CupertinoThemeData(
  brightness: Brightness.light
);
CupertinoThemeData dark=CupertinoThemeData(brightness: Brightness.dark);

