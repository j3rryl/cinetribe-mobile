import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade200,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
      inversePrimary: Colors.grey.shade300,
    ),
    iconTheme: const IconThemeData(color: Colors.pink),
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: const Color.fromRGBO(151, 40, 47, 1),
          displayColor: Colors.white,
        ));
