import 'dart:math';

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
  TransactionType currentType = TransactionType.income;
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
    incomes.sort((a, b) => a.date.compareTo(b.date));
    expenses.sort((a, b) => a.date.compareTo(b.date));
  }

  getExpenses() {
    currentType = TransactionType.expense;
    emitState();
  }

  getIncomes() {
    currentType = TransactionType.income;
    emitState();
  }

  addExpense(Expense expense) {
    expenses.insert(0, expense);
    emitState();
  }

  addIncome(Income income) {
    print(income.amount);
    incomes.insert(0, income);
    emitState();
  }

  emitState() {
    switch (currentType) {
      case TransactionType.expense:
        emit(HomeTransactions(
          balance: balance,
          income: incomeAmount,
          expense: expenseAmount,
          transactions: expenses,
        ));
        break;
      case TransactionType.income:
        emit(HomeTransactions(
          balance: balance,
          income: incomeAmount,
          expense: expenseAmount,
          transactions: incomes,
        ));
        break;
    }
  }
}
