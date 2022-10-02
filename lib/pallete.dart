//palette.dart
import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xffb1b2ff, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffb9baff), //10%
      100: Color(0xffc1c1ff), //20%
      200: Color(0xffc8c9ff), //30%
      300: Color(0xffd0d1ff), //40%
      400: Color(0xffd8d9ff), //50%
      500: Color(0xffe0e0ff), //60%
      600: Color(0xffe8e8ff), //70%
      700: Color(0xffeff0ff), //80%
      800: Color(0xfff7f7ff), //90%
      900: Color(0xffffffff), //100%
    },
  );
} // you can define define int 500 as the default shade and add your lighter tints above and darker tints below.
