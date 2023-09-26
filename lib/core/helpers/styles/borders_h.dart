import 'package:flutter/material.dart';
import 'package:my_wallet/core/helpers/styles/colors_h.dart';

class BordersHelper {
  static double width = 1;
  //
  static BoxBorder get b1 => Border.all(
        width: width,
        color: ColorsHelper.borders,
      );
}
