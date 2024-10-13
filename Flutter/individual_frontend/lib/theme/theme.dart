import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
  dividerColor: Colors.white24,
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.yellow,
      titleTextStyle: TextStyle(
          color: Colors.black87, fontSize: 30, fontWeight: FontWeight.w700),
      centerTitle: true),
  listTileTheme: const ListTileThemeData(iconColor: Colors.yellow),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    labelSmall: TextStyle(
      color: Colors.grey,
    ),
  ),
  useMaterial3: true,
);
