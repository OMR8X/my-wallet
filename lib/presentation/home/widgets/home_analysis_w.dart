import 'package:flutter/material.dart';
import 'package:my_wallet/core/helpers/styles/borders_h.dart';
import 'package:my_wallet/core/helpers/styles/colors_h.dart';
import 'package:my_wallet/core/helpers/styles/radius_h.dart';
import 'package:my_wallet/core/helpers/styles/shadows_h.dart';
import 'package:my_wallet/core/helpers/styles/sizes_h.dart';
import 'package:my_wallet/core/helpers/styles/spacing_h.dart';
import 'package:my_wallet/core/widgets/indecators/categories_circular_indicator_widget.dart';
import 'package:my_wallet/dump/list_transactions.dart';
import 'package:my_wallet/features/transactions/data/data_sources/styles.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';

class HomeAnalysisWidget extends StatelessWidget {
  const HomeAnalysisWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: SizesHelper.mainTileWidth(context),
      decoration: BoxDecoration(
          color: ColorsHelper.tiles,
          borderRadius: RadiusHelper.r2,
          border: BordersHelper.b1,
          boxShadow: [
            ShadowsHelper.sh2,
          ]),
      child: Row(
        children: [
          // indicator
          Expanded(
            flex: 10,
            child: CategoriesCircularIndicatorWidget(
              transaction: dumpListOfTransaction,
            ),
          ),
          const VerticalDivider(
            color: ColorsHelper.borders,
            thickness: 2,
            width: 0,
          ),
          // elements
          Expanded(
            flex: 8,
            child: TransactionsListWidget(
              transaction: dumpListOfTransaction,
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionsListWidget extends StatefulWidget {
  const TransactionsListWidget({super.key, required this.transaction});
  // all transactions
  final List<Transaction> transaction;
  @override
  State<TransactionsListWidget> createState() => _TransactionsListWidgetState();
}

class _TransactionsListWidgetState extends State<TransactionsListWidget> {
  // widget size
  Size? size;
  // store the full amount of money
  double fullAmount = 0.0;
  // collect data
  Map<String, double> data = {};
  //
  List<Widget> items = [];
  void initData() {
    fullAmount = 0.0;
    for (var t in widget.transaction) {
      fullAmount += t.amount;
      data[t.category] ??= 0.0; // Initialize to 0.0 if null
      data[t.category] = data[t.category]! + t.amount;
    }
    data.forEach((key, value) {
      items.add(TransactionsListItem(
        category: key,
        color: getStyleByCategory(key).color,
        amount: value,
      ));
    });
    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initData();
      if (context.size != null) {
        setState(() {
          size = Size(context.size!.width * 0.7, context.size!.height * 0.8);
        });
      }
    });
    super.initState();
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
                final start = index * 5;
                final end = (index + 1) * 5;
                final sublist = items.sublist(
                  start,
                  end < items.length ? end : items.length,
                );
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //
        Text(
          category,
          style: const TextStyle(color: ColorsHelper.text1, fontSize: 10),
        ),
        //
        SpacingHelper.w1,
        //
        Icon(
          Icons.circle,
          size: 6.0,
          color: color,
        ),
      ],
    );
  }
}
