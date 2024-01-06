import 'package:flutter/material.dart';

class AgricultureTheme {
  static final timePickerTheme = TimePickerThemeData(
      confirmButtonStyle: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
    const Color(0xfffcb064),
  )),
  cancelButtonStyle: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
    const Color(0xfffcb064),
  )),
  backgroundColor: const Color(0xfffdc893)
  );
  static final defaultTheme = ThemeData(
    primarySwatch: Colors.blue,
    colorScheme: const ColorScheme.light(
        primary: Color(0xfffcb064),
        secondary: Color(0xFFAAD9BB),
        inversePrimary: Color(0xFF80BCBD),
        error: Color(0xFFED6B5E),
        primaryContainer: Color(0xfff8f4f4),
        secondaryContainer: Color(0xFFEDF4F3)),
    appBarTheme: const AppBarTheme(
        toolbarHeight: 65,
        titleTextStyle: TextStyle(color: Colors.black),
        color: Color(0xFFFAFAFA),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black)),
    scaffoldBackgroundColor: const Color(0xFFFAFAFA),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF28C1EA)),
      ),
    ),
    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Color(0xFFED6B5E),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
    ),
    useMaterial3: true,
  );
}
