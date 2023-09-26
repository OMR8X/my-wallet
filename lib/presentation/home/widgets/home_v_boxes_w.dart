import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_wallet/core/helpers/assets/fonts_h.dart';
import 'package:my_wallet/core/helpers/assets/images_h.dart';
import 'package:my_wallet/core/helpers/styles/borders_h.dart';
import 'package:my_wallet/core/helpers/styles/colors_h.dart';
import 'package:my_wallet/core/helpers/styles/fonts_h.dart';
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
      width: SizesHelper.mainTileWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Box(
            color: Colors.red,
            title: '1200\$',
            subTitle: 'الصرف',
            iconPath: UIIcon.downArrow,
          ),
          SpacingHelper.w2,
          const Box(
            color: Colors.green,
            title: '900\$',
            subTitle: 'الدخل',
            iconPath: UIIcon.upArrow,
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
    required this.iconPath,
  });
  final Color color;
  final String iconPath;
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
            // icon
            Expanded(
              flex: 5,
              child: SizedBox(
                child: SvgPicture.asset(
                  iconPath,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                ),
              ),
            ),
            // text
            Expanded(
              flex: 7,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SpacingHelper.widthExtender,
                      Text(
                        title,
                        style: FontsStylesHelper.textStyle15,
                      ),
                      SpacingHelper.h1,
                      Text(
                        subTitle,
                        style: FontsStylesHelper.textStyle12,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
