import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_wallet/core/injection/a_injector.dart';
import 'package:my_wallet/features/transactions/data/models/expense_m.dart';
import 'package:my_wallet/features/transactions/data/models/income_m.dart';
import 'package:my_wallet/features/transactions/domain/entities/expense.dart';
import 'package:my_wallet/features/transactions/domain/entities/income.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';
import 'package:my_wallet/features/transactions/domain/usecases/add_transaction.dart';
import 'package:my_wallet/features/transactions/domain/usecases/delete_transaction.dart';
import 'package:my_wallet/features/transactions/domain/usecases/get_recent_transactions.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading());
  //
  double balance = 0.0;
  //
  double incomeAmount = 0.0;
  //
  double expenseAmount = 0.0;
  // incomes & expenses
  List<Income> incomes = [];
  List<Expense> expenses = [];
  // which type is showing right now
  TransactionType currentType = TransactionType.income;
  // use cases
  AddTransactionUS addTransaction = locator();
  DeleteTransactionUS deleteTransactionUS = locator();
  GetRecentTransactionsUS recentTransactions = locator();
  init() async {
    List<Transaction> transactions = [];
    transactions = await recentTransactions();
    // fake data :
    for (var t in transactions) {
      if (t.runtimeType == IncomeModel) {
        incomes.add(t as Income);
        incomeAmount += t.amount;
      } else if (t.runtimeType == ExpenseModel) {
        expenses.add(t as Expense);
        expenseAmount += t.amount;
      }
      calculateBalance();
    }
  }

  getExpenses() {
    currentType = TransactionType.expense;
    emitState();
  }

  getIncomes() {
    currentType = TransactionType.income;
    emitState();
  }

  addExpense(Expense expense) async {
    expenses.insert(0, expense);
    addTransaction(expense);
    calculateBalance();
    emitState();
  }

  addIncome(Income income) async {
    incomes.insert(0, income);
    addTransaction(income);
    calculateBalance();
    emitState();
  }

  deleteTransaction(Transaction t) async {
    switch (currentType) {
      case TransactionType.expense:
        expenses.removeWhere((e) => e.id == t.id);
        break;
      case TransactionType.income:
        incomes.removeWhere((e) => e.id == t.id);
        break;
    }
    deleteTransactionUS.call(t);
    calculateBalance();
    emitState();
  }

  calculateBalance() {
    balance = 0;
    for (var i in incomes) {
      balance += i.amount;
    }
    for (var e in expenses) {
      balance -= e.amount;
    }
  }

  emitState() {
    switch (currentType) {
      case TransactionType.expense:
        emit(HomeTransactions(
          balance: balance,
          income: incomeAmount,
          expense: expenseAmount,
          transactions: expenses,
          currentType: currentType,
        ));
        break;
      case TransactionType.income:
        emit(HomeTransactions(
          balance: balance,
          income: incomeAmount,
          expense: expenseAmount,
          transactions: incomes,
          currentType: currentType,
        ));
        break;
    }
  }
}
