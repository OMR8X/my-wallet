import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_wallet/core/helpers/localization/app_localization.dart';
import 'package:my_wallet/core/helpers/styles/fonts_h.dart';
import 'package:my_wallet/core/helpers/styles/spacing_h.dart';
import 'package:my_wallet/features/transactions/data/data_sources/styles.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';
import '../../../core/helpers/styles/sizes_h.dart';

class TransactionWidget extends StatefulWidget {
  const TransactionWidget({
    super.key,
    required this.transaction,
  });
  final List<Transaction> transaction;

  @override
  State<TransactionWidget> createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget> {
  double amount = 0.0;
  @override
  void initState() {
    for (var t in widget.transaction) {
      amount += t.amount;
    }
    super.initState();
  }

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
                backgroundColor: widget.transaction.first.transStyle.color,
                child: widget.transaction.first.transStyle.icon.isNotEmpty
                    ? SvgPicture.asset(widget.transaction.first.transStyle.icon)
                    : const SizedBox(),
              ),
            ),
          ),
          SpacingHelper.w1,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.transaction.last.category.tr(context),
                  style: FontsStylesHelper.textStyle15),
              SpacingHelper.h1,
              const Text(
                'عملية',
                style: FontsStylesHelper.textStyle10,
              ),
            ],
          ),
          const Spacer(),
          Text('$amount\$', style: FontsStylesHelper.textStyle12),
        ],
      ),
    );
  }
}
