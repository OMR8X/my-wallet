import 'package:flutter/material.dart';

class SizesHelper {
  static const double radius = 20.0;
  static double mainTileWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width - radius;
  }
}
