import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:my_wallet/core/helpers/localization/app_localization.dart';
import 'package:my_wallet/core/helpers/styles/fonts_h.dart';
import 'package:my_wallet/core/helpers/styles/spacing_h.dart';
import 'package:my_wallet/features/transactions/data/data_sources/styles.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';
import '../../../core/helpers/styles/sizes_h.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    super.key,
    required this.transaction,
  });
  final Transaction transaction;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizesHelper.mainTileWidth(context),
      height: 70,
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
                radius: 30,
                backgroundColor: transaction.transStyle.color,
                child: transaction.transStyle.icon.isNotEmpty
                    ? SvgPicture.asset(transaction.transStyle.icon)
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
          Text('${transaction.amount}\$', style: FontsStylesHelper.textStyle12),
        ],
      ),
    );
  }
}
