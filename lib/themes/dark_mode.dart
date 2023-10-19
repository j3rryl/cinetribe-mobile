import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade200,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
      inversePrimary: Colors.grey.shade300,
    ),
    iconTheme: const IconThemeData(color: Colors.pink),
    textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: const Color.fromRGBO(151, 40, 47, 1),
          displayColor: Colors.white,
        ));
