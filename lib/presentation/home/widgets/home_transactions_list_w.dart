import 'package:flutter/material.dart';
import 'package:my_wallet/core/helpers/styles/dividers_helper.dart';
import 'package:my_wallet/core/helpers/styles/fonts_h.dart';
import 'package:my_wallet/core/helpers/styles/sizes_h.dart';
import 'package:my_wallet/dump/list_transactions.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';
import 'package:my_wallet/presentation/home/widgets/home_transaction_w.dart';

class HomeTransactionsListWidget extends StatelessWidget {
  const HomeTransactionsListWidget({
    super.key, required this.transactions,
  });
  final List<Transaction> transactions;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: SizesHelper.mainTileWidth(context) - 10,
        child: Column(
          children: [
            SizedBox(
              height: 75,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      // color: Colors.cyan,
                      child: const Center(
                        child: Text(
                          "سجلات الدخل",
                          style: FontsStylesHelper.textStyle14,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.orange,
                      child: const Center(
                        child: Text(
                          "سجلات الصرف",
                          style: FontsStylesHelper.textStyle14,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            DividerHelper.h1,
            Expanded(
              child: ListView(
                children: dumpListOfTransaction
                    .map((e) => TransactionWidget(
                        transaction: e,
                        count: dumpListOfTransaction
                            .where((element) => element.category == e.category)
                            .toList()
                            .length))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
