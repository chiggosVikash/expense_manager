
import 'package:expense_manager/app_theme/custom_text_theme.dart';
import 'package:flutter/material.dart';

final darkTheme = ThemeData.dark(

  // textTheme: CustomTextTheme.textTheme,
  // colorScheme: ColorScheme.fromSeed(seedColor: Colors.black26),

  useMaterial3: true
);


final lightTheme = ThemeData(
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      // minimumSize: MaterialStateProperty.all<Size>(Size.fromWidth(50))
    )
  ),
  useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  textTheme: CustomTextTheme.textTheme
);