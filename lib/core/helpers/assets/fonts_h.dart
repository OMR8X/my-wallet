import 'package:flutter/material.dart';

abstract class FontStyle {
  static const textStyle7 = TextStyle(
    fontSize: 7,
    // Regular -- bold
    fontWeight: FontWeight.w400,
  );

  static const textStyle10 = TextStyle(
    fontSize: 10,
    //Bold -- sub-titles
    fontWeight: FontWeight.bold,
  );

  static const textStyle12 = TextStyle(
    fontSize: 12,
    // Bold -- numbers
    fontWeight: FontWeight.bold,
  );

  static const textStyle13 = TextStyle(
    fontSize: 13,
    // Bold --  tap_bar_titles
    fontWeight: FontWeight.bold,
  );

  static const textStyle14 = TextStyle(
    fontSize: 14,
    // Semi-Bold -- Titles
    fontWeight: FontWeight.bold,
  );

  static const textStyle15 = TextStyle(
    fontSize: 15,
    // Extra-bold
    fontWeight: FontWeight.w800,
  );
  static const textStyle40 = TextStyle(
    fontSize: 40,
    // Extra-Bold -- Total Amount
    fontWeight: FontWeight.w800,
  );
}
