import 'package:flutter/material.dart';

final ThemeData themeDark = ThemeData(
  splashFactory: NoSplash.splashFactory,
  colorScheme: const ColorScheme(
    primary: Color(0xff302f30),
    primaryVariant: Color(0xff479725),
    secondary: Color(0xfffbe36a),
    secondaryVariant: Color(0xffE3BD54),
    surface: Color(0xff424242),
    background: Color(0xff616161),
    error: Color(0xffb83733),
    onPrimary: Color(0xffffffff),
    onSecondary: Color(0xff000000),
    onSurface: Color(0xff000000),
    onBackground: Color(0xffffffff),
    onError: Color(0xffffffff),
    brightness: Brightness.dark,
  ),
  brightness: Brightness.dark,
  disabledColor: const Color(0xFF464646),
  backgroundColor: const Color(0xffffffff),
  dialogTheme: const DialogTheme(elevation: 12),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
