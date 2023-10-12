import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wallet/core/helpers/styles/colors_h.dart';
import 'package:my_wallet/core/helpers/styles/dividers_helper.dart';
import 'package:my_wallet/core/helpers/styles/fonts_h.dart';
import 'package:my_wallet/core/helpers/styles/radius_h.dart';
import 'package:my_wallet/core/helpers/styles/sizes_h.dart';
import 'package:my_wallet/core/helpers/styles/spacing_h.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';
import 'package:my_wallet/presentation/home/state/home/home_cubit.dart';
import 'package:my_wallet/presentation/home/widgets/transaction_w.dart';

class HomeTransactionsListWidget extends StatefulWidget {
  const HomeTransactionsListWidget({
    super.key,
    required this.transactions,
    required this.currentType,
  });
  final List<Transaction> transactions;
  final TransactionType currentType;

  @override
  State<HomeTransactionsListWidget> createState() =>
      _HomeTransactionsListWidgetState();
}

class _HomeTransactionsListWidgetState
    extends State<HomeTransactionsListWidget> {
  List<Widget> list = [];
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
        onLongPress: (t) {
          context.read<HomeCubit>().deleteTransaction(t);
        },
      ));
    }
    list.add(const SizedBox(height: 60));
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
              height: 55,
              child: Row(
                children: [
                  ItemWidget(
                    onTap: showIncomeList,
                    selected: widget.currentType == TransactionType.income,
                    color: ColorsHelper.green,
                    title: "سجلات الدخل",
                  ),
                  ItemWidget(
                    onTap: showExpenseList,
                    selected: widget.currentType == TransactionType.expense,
                    color: ColorsHelper.red,
                    title: "سجلات الصرف",
                  ),
                ],
              ),
            ),
            Row(
              children: [
                DividerHelper.h1,
              ],
            ),
            SpacingHelper.h1,
            DividerHelper.h1,
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: list,
              ),
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

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.onTap,
    required this.selected,
    required this.color,
    required this.title,
  });
  final VoidCallback onTap;
  final bool selected;
  final Color color;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        onLongPress: onTap,
        borderRadius: RadiusHelper.r2,
        child: Align(
          alignment: const Alignment(0, 0.25),
          child: Text(
            title,
            style: FontsStylesHelper.textStyle14.copyWith(
                color: selected ? color : ColorsHelper.text2,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
