import 'package:flutter/material.dart';

class SizesHelper {
  static const double radius = 25.0;
  static double mainTileWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width - radius;
  }
}
