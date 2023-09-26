import 'package:flutter/material.dart';
import 'package:my_wallet/core/helpers/styles/borders_h.dart';
import 'package:my_wallet/core/helpers/styles/colors_h.dart';
import 'package:my_wallet/core/helpers/styles/radius_h.dart';
import 'package:my_wallet/core/helpers/styles/shadows_h.dart';
import 'package:my_wallet/core/helpers/styles/sizes_h.dart';
import 'package:my_wallet/core/helpers/styles/spacing_h.dart';

class HomeViewBoxesWidgets extends StatelessWidget {
  const HomeViewBoxesWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (SizesHelper.mainTileWidth(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Box(),
          SpacingHelper.w2,
          const Box(),
        ],
      ),
    );
  }
}

class Box extends StatelessWidget {
  const Box({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 90,
        decoration: BoxDecoration(
            color: ColorsHelper.tiles,
            border: BordersHelper.b1,
            borderRadius: RadiusHelper.r2,
            boxShadow: [
              ShadowsHelper.sh2,
            ]),
      ),
    );
  }
}
