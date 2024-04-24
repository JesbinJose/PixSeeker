import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Color(0xFF374151),
    ),
  ),
  hintColor: const Color(0xFF374151),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
  ),
);
