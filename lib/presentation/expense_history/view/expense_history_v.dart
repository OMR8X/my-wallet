import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wallet/core/helpers/styles/dividers_helper.dart';
import 'package:my_wallet/core/helpers/styles/fonts_h.dart';
import 'package:my_wallet/core/helpers/styles/sizes_h.dart';
import 'package:my_wallet/core/helpers/styles/spacing_h.dart';
import 'package:my_wallet/core/widgets/indecators/mini_loading_indicator_w.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';
import 'package:my_wallet/presentation/expense_history/state/cubit/expense_cubit.dart';
import 'package:my_wallet/presentation/home/widgets/transaction_w.dart';

class ExpenseHistoryView extends StatefulWidget {
  const ExpenseHistoryView({super.key});

  @override
  State<ExpenseHistoryView> createState() => _ExpenseHistoryViewState();
}

class _ExpenseHistoryViewState extends State<ExpenseHistoryView> {
  @override
  void initState() {
    context.read<ExpenseCubit>().getTransactions();
    super.initState();
  }

  List<Widget> getChildren(List<Transaction> transactions) {
    List<Widget> children = [];
    // sort by date
    Map<String, List<Transaction>> data = {};
    //
    for (var t in transactions) {
      String k = t.date.toString().substring(0, 10);
      data[k] ??= [];
      data[k] = data[k]! + [t];
    }
    //
    data.forEach((key, value) {
      children.add(DividerHelper.h1);
      children.add(SpacingHelper.h4);
      children.add(TimeInfo(time: key));
      children.addAll(transactionsToWidgets(value));
      children.add(SpacingHelper.h4);
    });
    //
    children.add((DividerHelper.h1));
    // build widgets
    return children;
  }

  List<Widget> transactionsToWidgets(List<Transaction> transactions) {
    List<Widget> widgets = [];
    for (var t in transactions) {
      widgets.add(
        TransactionWidget(
          transaction: t,
          onLongPress: (t) {
            context.read<ExpenseCubit>().deleteTransaction(t);
          },
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("سجلات الصرف"),
      ),
      body: BlocBuilder<ExpenseCubit, ExpenseState>(
        builder: (context, state) {
          if (state is ExpenseInitial) {
            return ListView(
              children: getChildren(state.transactions),
            );
          }
          return const MiniLoadingIndicatorWidget();
        },
      ),
    );
  }
}

class TimeInfo extends StatelessWidget {
  const TimeInfo({super.key, required this.time});
  final String time;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 15,
          width: SizesHelper.mainTileWidth(context),
          child: Text(
            time,
            style: FontsStylesHelper.textStyle10,
          ),
        ),
      ],
    );
  }
}
