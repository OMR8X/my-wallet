import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_wallet/core/helpers/functions/mergers/transactions_m.dart';
import 'package:my_wallet/dump/list_transactions.dart';
import 'package:my_wallet/features/transactions/domain/entities/expense.dart';
import 'package:my_wallet/features/transactions/domain/entities/income.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading());
  double balance = 0.0;
  double incomeAmount = 0.0;
  double expenseAmount = 0.0;
  List<Income> incomes = [];
  List<Expense> expenses = [];
  late (Map<String, List<Transaction>>, double) incomesCategoriesAmounts;
  late (Map<String, List<Transaction>>, double) expensesCategoriesAmounts;
  init() async {
    // fake data :
    for (var t in dumpListOfTransaction) {
      if (t.runtimeType == Income) {
        incomes.add(t as Income);
        incomeAmount += t.amount;
      } else if (t.runtimeType == Expense) {
        expenses.add(t as Expense);
        expenseAmount += t.amount;
      }
    }
    incomesCategoriesAmounts = mergeTransactions(incomes);
    expensesCategoriesAmounts = mergeTransactions(expenses);
  }

  getExpenses() {
    print("get expense");
    emit(HomeExpenses(
      balance: balance,
      income: incomeAmount,
      expense: expenseAmount,
      expenses: expenses,
      expenseCategoriesAmounts: expensesCategoriesAmounts,
    ));
  }

  getIncomes() {
    print("get incomes");
    emit(HomeIncomes(
      balance: balance,
      income: incomeAmount,
      expense: expenseAmount,
      incomes: incomes,
      incomesCategoriesAmounts: incomesCategoriesAmounts,
    ));
  }
}
