import 'package:flutter/material.dart';

final ThemeData themeLight = ThemeData(
  splashFactory: NoSplash.splashFactory,
  colorScheme: const ColorScheme(
    primary: Color(0xff302f30),
    primaryVariant: Color(0xff479725),
    secondary: Color(0xfffbe36a),
    secondaryVariant: Color(0xffE3BD54),
    surface:  Color(0xffffffff),
    background: Color(0xffE6E6E6),
    error: Color(0xffb83733),
    onPrimary: Color(0xff424242),
    onSecondary: Color(0xffffffff),
    onSurface: Color(0xffffffff),
    onBackground: Color(0xff000000),
    onError: Color(0xff000000),
    brightness: Brightness.light,
  ),
  brightness: Brightness.light,
  disabledColor: const Color(0xFF464646),
  backgroundColor: const Color(0xffffffff),
  dialogTheme: const DialogTheme(elevation: 12),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
