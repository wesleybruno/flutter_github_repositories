import 'package:flutter/material.dart';

abstract class Cores {
  static final preto = const Color(0xFF000000);
  static final branco = Color(0xFFFFFFFF);
  static final azulClaro = Color(0xFFB0EFF3);
  static final transparente = Color(0x00000000);

  static const MaterialColor cinza = MaterialColor(
    0xFFF3F3F3,
    <int, Color>{
      0: Color(0xFFFFFFFF),
      50: Color(0xFFEBEBEB),
      100: Color(0xFFE6E6E6),
      200: Color(0xFFA1A1A1),
      300: Color(0xFF565656),
      400: Color(0xFF666666),
      500: Color(0xFF5C5C5C)
    },
  );
}
