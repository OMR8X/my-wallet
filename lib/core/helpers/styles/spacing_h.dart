import 'package:flutter/material.dart';

class SpacingHelper {
  static const double unit = 2.0;
  // height spacers
  SizedBox get h1 => const SizedBox(height: unit);
  SizedBox get h2 => const SizedBox(height: unit * 2);
  SizedBox get h3 => const SizedBox(height: unit * 3);
  SizedBox get h4 => const SizedBox(height: unit * 4);
  SizedBox get h5 => const SizedBox(height: unit * 5);
  SizedBox get h6 => const SizedBox(height: unit * 6);
  // width spacers
  SizedBox get w1 => const SizedBox(width: unit);
  SizedBox get w2 => const SizedBox(width: unit * 2);
  SizedBox get w3 => const SizedBox(width: unit * 3);
  SizedBox get w4 => const SizedBox(width: unit * 4);
  SizedBox get w5 => const SizedBox(width: unit * 5);
  SizedBox get w6 => const SizedBox(width: unit * 6);
  //
}
