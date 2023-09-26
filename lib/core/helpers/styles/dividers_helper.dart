import 'package:flutter/material.dart';
import 'package:my_wallet/core/helpers/styles/colors_h.dart';

class DividerHelper {
  static const double thickness = 1;
  static Divider get h1 => const Divider(
        height: 1,
        thickness: thickness,
        color: ColorsHelper.borders,
      );
  static VerticalDivider get v1 => const VerticalDivider(
        width: 1,
        thickness: thickness,
        color: ColorsHelper.borders,
      );
}
