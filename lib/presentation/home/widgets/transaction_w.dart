import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:my_wallet/core/helpers/localization/app_localization.dart';
import 'package:my_wallet/core/helpers/styles/colors_h.dart';
import 'package:my_wallet/core/helpers/styles/fonts_h.dart';
import 'package:my_wallet/core/helpers/styles/radius_h.dart';
import 'package:my_wallet/core/helpers/styles/spacing_h.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';
import '../../../core/helpers/styles/sizes_h.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    super.key,
    required this.transaction,
    this.onLongPress,
  });
  final Transaction transaction;
  final Function(Transaction t)? onLongPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: RadiusHelper.r2,
      onLongPress: () {
        if (onLongPress == null) return;
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: RadiusHelper.r2),
            title: const Text(
              "هل ترغب بحذف العنصر المحدد؟",
              style: FontsStylesHelper.textStyle18,
            ),
            backgroundColor: ColorsHelper.background,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          onLongPress!(transaction);
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsHelper.red,
                        ),
                        child: const Text("حذف"),
                      ),
                    ),
                    SpacingHelper.w2,
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsHelper.borders,
                        ),
                        child: const Text("الغاء"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          width: SizesHelper.mainTileWidth(context),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 60,
                child: Padding(
                  padding: Directionality.of(context).index == 0
                      ? const EdgeInsets.only(left: 8)
                      : const EdgeInsets.only(right: 8),
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: transaction.transStyle.color,
                    child: transaction.transStyle.icon.isNotEmpty
                        ? SvgPicture.asset(
                            transaction.transStyle.icon,
                            width: 24,
                          )
                        : const SizedBox(),
                  ),
                ),
              ),
              SpacingHelper.w1,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(transaction.category.tr(context),
                      style: FontsStylesHelper.textStyle15),
                  SpacingHelper.h1,
                  Text(
                    DateFormat("aa hh:mm").format(transaction.date),
                    style: FontsStylesHelper.textStyle10,
                  ),
                ],
              ),
              const Spacer(),
              Text('${transaction.amount}\$',
                  style: FontsStylesHelper.textStyle12),
            ],
          ),
        ),
      ),
    );
  }
}
