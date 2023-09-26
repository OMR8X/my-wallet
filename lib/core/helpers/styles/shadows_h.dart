import 'package:flutter/material.dart';
import 'package:my_wallet/core/helpers/styles/colors_h.dart';

class ShadowsHelper {
  static BoxShadow get sh1 => getBoxShadow(b: 1, s: 1);
  static BoxShadow get sh2 => getBoxShadow(b: 2, s: 3);
  //
  static BoxShadow getBoxShadow({
    Color c = ColorsHelper.shadows,
    Offset? o,
    required double b,
    required double s,
  }) {
    return BoxShadow(
      color: c,
      offset: o ?? const Offset(0, 2),
      blurRadius: b,
      spreadRadius: s,
    );
  }
}
