import 'package:my_wallet/features/transactions/domain/entities/expense.dart';
import 'package:my_wallet/features/transactions/domain/entities/income.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';

abstract class TransactionsRepository {
  // Getters
  Future<List<Transaction>> getRecentTransactions();
  Future<List<Income>> getAllIncomes();
  Future<List<Expense>> getAllExpenses();
  Future<(double, double)> getExpensesAndIncomeAmount();
  // Adders
  Future<void> addIncome(Income i);
  Future<void> addExpense(Expense e);
  // updaters
  Future<void> updateTransaction(Transaction t);
  //Deleters
  Future<void> deleteTransaction(Transaction t);
}
