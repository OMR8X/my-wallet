import 'package:flutter/material.dart';

class SpacingHelper {
  static const double unit = 4.0;
  // height spacers
  static SizedBox get h1 => const SizedBox(height: unit);
  static SizedBox get h2 => const SizedBox(height: unit * 2);
  static SizedBox get h3 => const SizedBox(height: unit * 3);
  static SizedBox get h4 => const SizedBox(height: unit * 4);
  static SizedBox get h5 => const SizedBox(height: unit * 5);
  static SizedBox get h6 => const SizedBox(height: unit * 6);
  // width spacers
  static SizedBox get w1 => const SizedBox(width: unit);
  static SizedBox get w2 => const SizedBox(width: unit * 2);
  static SizedBox get w3 => const SizedBox(width: unit * 3);
  static SizedBox get w4 => const SizedBox(width: unit * 4);
  static SizedBox get w5 => const SizedBox(width: unit * 5);
  static SizedBox get w6 => const SizedBox(width: unit * 6);
  // extenders
  static SizedBox get widthExtender => const SizedBox(width: double.infinity);

  const SpacingHelper();
}
