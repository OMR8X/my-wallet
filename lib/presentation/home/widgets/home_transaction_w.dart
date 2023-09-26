import 'package:flutter/material.dart';
import 'package:my_wallet/core/helpers/styles/fonts_h.dart';
import 'package:my_wallet/core/helpers/styles/spacing_h.dart';
import 'package:my_wallet/features/transactions/data/data_sources/styles.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';
import '../../../core/helpers/styles/sizes_h.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    super.key,
    required this.transaction,
    required this.count,
  });
  final Transaction transaction;
  final int count;

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
                backgroundColor: getStyleByCategory(transaction.category).color,
              ),
            ),
          ),
          SpacingHelper.w1,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.category,
                style: FontsStylesHelper.textStyle15,
              ),
              const Text(
                'عملية ',
                style: FontsStylesHelper.textStyle14,
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
