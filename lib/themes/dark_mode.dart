import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
      inversePrimary: Colors.grey.shade300,
    ),
    iconTheme: const IconThemeData(color: Colors.pink),
    textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: Colors.pink,
          displayColor: Colors.white,
        ));
