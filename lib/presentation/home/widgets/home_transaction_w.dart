import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_wallet/core/helpers/styles/fonts_h.dart';
import 'package:my_wallet/core/helpers/styles/spacing_h.dart';
import 'package:my_wallet/features/transactions/data/data_sources/styles.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';

import '../../../core/helpers/styles/colors_h.dart';
import '../../../core/helpers/styles/sizes_h.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    super.key,
    required this.transaction,
  });
  final List<Transaction> transaction;
  
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
              padding: const EdgeInsets.only(left: 8),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: transaction.first.transStyle.color,
                child: transaction.first.transStyle.icon.isNotEmpty
                    ? SvgPicture.asset(transaction.first.transStyle.icon)
                    : const SizedBox(),
              ),
            ),
          ),
          SpacingHelper.w1,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(transaction.first.category,
                  style: FontsStylesHelper.textStyle15),
              SpacingHelper.h1,
              const Text(
                'عملية',
                style: FontsStylesHelper.textStyle10,
              ),
            ],
          ),
          const Spacer(),
          const Text('2300', style: FontsStylesHelper.textStyle12),
        ],
      ),
    );
  }
}
