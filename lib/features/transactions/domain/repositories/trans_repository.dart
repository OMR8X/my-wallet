import 'package:my_wallet/features/transactions/domain/entities/expense.dart';
import 'package:my_wallet/features/transactions/domain/entities/income.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';

abstract class TransactionsRepository {
  // Getters
  Future<List<Transaction>> getLastTransactions();
  Future<List<Transaction>> getRecentTransactions();
  //
  Future<List<Income>> getAllIncomes();
  Future<List<Expense>> getAllExpenses();
  //
  Future<(double, double)> getExpensesAndIncomeAmount();
  // Adders
  Future<void> addTransaction(Transaction t);
  // updaters
  Future<void> updateTransaction(Transaction t);
  //Deletes
  Future<void> deleteTransaction(Transaction t);
}
