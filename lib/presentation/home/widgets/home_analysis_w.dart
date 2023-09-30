import 'package:flutter/material.dart';
import 'package:my_wallet/core/helpers/localization/app_localization.dart';
import 'package:my_wallet/core/helpers/styles/borders_h.dart';
import 'package:my_wallet/core/helpers/styles/colors_h.dart';
import 'package:my_wallet/core/helpers/styles/radius_h.dart';
import 'package:my_wallet/core/helpers/styles/shadows_h.dart';
import 'package:my_wallet/core/helpers/styles/sizes_h.dart';
import 'package:my_wallet/core/helpers/styles/spacing_h.dart';
import 'package:my_wallet/core/widgets/indecators/categories_circular_indicator_widget.dart';
import 'package:my_wallet/dump/list_transactions.dart';
import 'package:my_wallet/features/transactions/data/data_sources/styles.dart';
import 'package:my_wallet/features/transactions/domain/entities/income.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';

class HomeAnalysisWidget extends StatelessWidget {
  const HomeAnalysisWidget({
    super.key,
    required this.transactions,
    required this.categoriesAmounts,
  });
  final List<Transaction> transactions;
  final (Map<String, List<Transaction>>, double) categoriesAmounts;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: SizesHelper.mainTileWidth(context),
      child: CategoriesCircularIndicatorWidget(
        transaction: transactions,
      ),
    );
  }
}

class TransactionsListWidget extends StatefulWidget {
  const TransactionsListWidget(
      {super.key, required this.transactions, required this.categoriesAmounts});
  // all transactions
  final List<Transaction> transactions;
  final (Map<String, List<Transaction>>, double) categoriesAmounts;
  @override
  State<TransactionsListWidget> createState() => _TransactionsListWidgetState();
}

class _TransactionsListWidgetState extends State<TransactionsListWidget> {
  // widget size
  Size? size;
  // widgets
  List<Widget> items = [];
  void initData() {
    setState(() {
      widget.categoriesAmounts.$1.forEach((key, value) {
        double amount = 0.0;
        for (var e in value) {
          amount += e.amount;
        }
        items.add(TransactionsListItem(
          category: key,
          color: getStyleByCategory(key).color,
          amount: amount,
        ));
      });
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.size != null) {
        setState(() {
          size = Size(context.size!.width, context.size!.height * 0.8);
        });
      }
      initData();
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TransactionsListWidget oldWidget) {
    initData();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: size?.width,
          height: size?.height,
          child: PageView.builder(
              itemCount: (items.length / 5).ceil(),
              itemBuilder: (context, index) {
                final start = index * 3;
                final end = (index + 1) * 3;
                final sublist = items.sublist(
                  start,
                  end < items.length ? end : items.length,
                );
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: sublist,
                );
              }),
        ),
      ],
    );
  }
}

class TransactionsListItem extends StatelessWidget {
  const TransactionsListItem({
    super.key,
    required this.category,
    required this.color,
    required this.amount,
  });
  final String category;
  final Color color;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizesHelper.mainTileWidth(context) / 2.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //
          Icon(
            Icons.circle,
            size: 6.0,
            color: color,
          ),

          //
          SpacingHelper.w1,
          //
          Text(
            category.tr(context),
            style: const TextStyle(
                color: ColorsHelper.text1,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
