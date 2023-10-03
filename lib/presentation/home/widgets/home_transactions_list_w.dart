import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wallet/core/helpers/functions/mergers/transactions_m.dart';
import 'package:my_wallet/core/helpers/styles/colors_h.dart';
import 'package:my_wallet/core/helpers/styles/dividers_helper.dart';
import 'package:my_wallet/core/helpers/styles/fonts_h.dart';
import 'package:my_wallet/core/helpers/styles/sizes_h.dart';
import 'package:my_wallet/features/transactions/domain/entities/expense.dart';
import 'package:my_wallet/features/transactions/domain/entities/income.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';
import 'package:my_wallet/presentation/home/state/home/home_cubit.dart';
import 'package:my_wallet/presentation/home/widgets/transaction_w.dart';

class HomeTransactionsListWidget extends StatefulWidget {
  const HomeTransactionsListWidget({
    super.key,
    required this.transactions,
  });
  final List<Transaction> transactions;

  @override
  State<HomeTransactionsListWidget> createState() =>
      _HomeTransactionsListWidgetState();
}

class _HomeTransactionsListWidgetState
    extends State<HomeTransactionsListWidget> {
  // widget size
  Size? size;
  List<Widget> list = [];
  bool showIncome = true;
  int selectedIndex = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initList();
    });
    super.initState();
  }

  initList() {
    list = [];
    for (var element in widget.transactions) {
      list.add(TransactionWidget(
        transaction: element,
      ));
    }
    setState(() {});
  }

  showIncomeList() {
    context.read<HomeCubit>().getIncomes();
  }

  showExpenseList() {
    context.read<HomeCubit>().getExpenses();
  }

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
                    child: InkWell(
                      onTap: showIncomeList,
                      // color: Colors.cyan,
                      child: Center(
                        child: Text(
                          "سجلات الدخل",
                          style: FontsStylesHelper.textStyle14.copyWith(
                            color: widget.transactions.runtimeType ==
                                    (List<Income>)
                                ? ColorsHelper.green
                                : ColorsHelper.text2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: showExpenseList,
                      // color: Colors.orange,
                      child: Center(
                        child: Text(
                          "سجلات الصرف",
                          style: FontsStylesHelper.textStyle14.copyWith(
                              color: widget.transactions.runtimeType ==
                                      (List<Expense>)
                                  ? ColorsHelper.red
                                  : ColorsHelper.text2),
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
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12),
                  children: list),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant HomeTransactionsListWidget oldWidget) {
    initList();
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }
}
