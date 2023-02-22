import 'package:flutter/material.dart';

class CompanyColors {
  static const primaryColorYellow = 0xffffFFD31E;

  static const MaterialColor colorYellow = MaterialColor(
    primaryColorYellow,
    <int, Color>{
      50: Color(0xFFE0EDF0),
      100: Color(0xFFB3D3D9),
      200: Color(0xFF80B6C0),
      300: Color(0xFF4D98A7),
      400: Color(0xFF268294),
      500: Color(primaryColorYellow),
      600: Color(0xFF006479),
      700: Color(0xFF00596E),
      800: Color(0xFF004F64),
      900: Color(0xFF003D51),
    },
  );
}
