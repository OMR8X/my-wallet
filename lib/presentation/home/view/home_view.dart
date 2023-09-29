
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wallet/core/helpers/styles/spacing_h.dart';
import 'package:my_wallet/core/widgets/indecators/mini_loading_indicator_w.dart';

import 'package:my_wallet/presentation/home/state/home/home_cubit.dart';
import 'package:my_wallet/presentation/home/widgets/bottom_sheet_w.dart';
import 'package:my_wallet/presentation/home/widgets/home_analysis_w.dart';
import 'package:my_wallet/presentation/home/widgets/home_transactions_list_w.dart';
import 'package:my_wallet/presentation/home/widgets/home_v_boxes_w.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<HomeCubit>().init();
      await context.read<HomeCubit>().getExpenses();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) {
                return const HomeBottomSheet();
              },
            );
          },
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeIncomes) {
              return Scaffold(
                appBar: AppBar(title: Text("الرصيد الحالي ${state.balance}")),
                body: Column(
                  children: [
                    SpacingHelper.widthExtender,
                    SpacingHelper.h4,
                    //
                    HomeAnalysisWidget(
                      transactions: state.incomes,
                      categoriesAmounts: state.incomesCategoriesAmounts,
                    ),
                    //
                    SpacingHelper.h6,
                    //
                    HomeViewBoxesWidgets(
                      income: state.income,
                      expense: state.expense,
                    ),
                    //
                    SpacingHelper.h2,
                    //
                    HomeTransactionsListWidget(
                      categoriesAmounts: state.incomesCategoriesAmounts,
                      selectedIndex: 0,
                    ),
                  ],
                ),
              );
            } else if (state is HomeExpenses) {
              return Scaffold(
                appBar: AppBar(title: Text("الرصيد الحالي ${state.balance}")),
                body: Column(
                  children: [
                    SpacingHelper.widthExtender,
                    SpacingHelper.h4,
                    //
                    HomeAnalysisWidget(
                      transactions: state.expenses,
                      categoriesAmounts: state.expenseCategoriesAmounts,
                    ),
                    //
                    SpacingHelper.h6,
                    //
                    HomeViewBoxesWidgets(
                      income: state.income,
                      expense: state.expense,
                    ),
                    //
                    SpacingHelper.h2,
                    //
                    HomeTransactionsListWidget(
                      categoriesAmounts: state.expenseCategoriesAmounts,
                      selectedIndex: 1,
                    ),
                  ],
                ),
              );
            }
            return const Scaffold(
              body: MiniLoadingIndicatorWidget(),
            );
          },
        ));
  }
}
