import 'package:flutter/material.dart';

class ShadowsManager {
  static const Color shadowsColor = Colors.black;
  static BoxShadow get sh1 => getBoxShadow(b: 1, s: 1);
  //
  static BoxShadow getBoxShadow({
    Color c = shadowsColor,
    Offset? o,
    required double b,
    required double s,
  }) {
    return BoxShadow(
      color: c,
      offset: o ?? const Offset(0.5, 0.5),
      blurRadius: b,
      spreadRadius: s,
    );
  }
}
