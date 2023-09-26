import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_wallet/core/helpers/assets/images_h.dart';
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
          Box(
            color: Colors.red,
            title: '',
            subTitle: '',
          ),
          SpacingHelper.w2,
          Box(
            color: Colors.green,
            title: '',
            subTitle: '',
          ),
        ],
      ),
    );
  }
}

class Box extends StatelessWidget {
  const Box({
    super.key,
    required this.color,
    required this.title,
    required this.subTitle,
  });
  final Color color;
  final String title;
  final String subTitle;
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
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: SizedBox(
                  child: SvgPicture.asset(
                    UIIcon.upArrow,
                    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                  ),
                )),
            const Expanded(flex: 7, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
