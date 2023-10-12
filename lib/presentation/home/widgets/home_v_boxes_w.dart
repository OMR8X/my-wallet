import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_wallet/core/helpers/assets/images_h.dart';
import 'package:my_wallet/core/helpers/styles/borders_h.dart';
import 'package:my_wallet/core/helpers/styles/fonts_h.dart';
import 'package:my_wallet/core/helpers/styles/radius_h.dart';
import 'package:my_wallet/core/helpers/styles/sizes_h.dart';
import 'package:my_wallet/core/helpers/styles/spacing_h.dart';
import 'package:my_wallet/presentation/expense_history/view/expense_history_v.dart';
import 'package:my_wallet/presentation/income_history/view/income_history_v.dart';

class HomeViewBoxesWidgets extends StatelessWidget {
  const HomeViewBoxesWidgets({
    super.key,
    required this.income,
    required this.expense,
  });
  final double income, expense;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizesHelper.mainTileWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Box(
            color: Colors.green,
            title: '$income\$',
            subTitle: 'الدخل',
            iconPath: UIIcon.upArrow,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const IncomeHistoryView()),
              );
            },
          ),
          SpacingHelper.w2,
          Box(
            color: Colors.red,
            title: '$expense\$',
            subTitle: 'الصرف',
            iconPath: UIIcon.downArrow,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const ExpenseHistoryView()),
              );
            },
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
    required this.onTap,
  });
  final Color color;
  final String iconPath;
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: RadiusHelper.r2,
        onTap: onTap,
        child: Container(
          height: 65,
          decoration: BoxDecoration(
              // color: ColorsHelper.tiles,
              border: BordersHelper.b1,
              borderRadius: RadiusHelper.r2,
              boxShadow: [
                // ShadowsHelper.sh2,
              ]),
          child: Row(
            children: [
              // text
              Expanded(
                flex: 7,
                child: SizedBox(
                  child: Padding(
                    padding: Directionality.of(context).index == 0
                        ? const EdgeInsets.only(right: 16.0)
                        : const EdgeInsets.only(left: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
              // icon
              Expanded(
                flex: 4,
                child: SizedBox(
                  child: SvgPicture.asset(
                    iconPath,
                    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
