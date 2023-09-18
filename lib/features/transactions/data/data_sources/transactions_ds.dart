import 'package:my_wallet/features/transactions/domain/entities/expense.dart';
import 'package:my_wallet/features/transactions/domain/entities/income.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

abstract class TransactionDataSource {
  // Getters
  Future<List<Transaction>> getRecentTransactions();
  Future<List<Income>> getAllIncomes();
  Future<List<Expense>> getAllExpenses();
  Future<(double, double)> getExpensesAndIncomeAmount();
  // Adders
  Future<void> addIncome(Income i);
  Future<void> addExpence(Expense e);
  // updaters
  Future<void> updateTransaction(Transaction t);
  //Deleters
  Future<void> deleteTransaction(Transaction t);
}

class TransactionDataSourceImpl implements TransactionDataSource {
  final sqflite.Database database;
  TransactionDataSourceImpl({required this.database});
  
  @override
  Future<void> addExpence(e) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> addIncome(i) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteTransaction(Transaction t) {
    throw UnimplementedError();
  }
  
  @override
  Future<(double, double)> getExpensesAndIncomeAmount() {
    throw UnimplementedError();
  }
  
  @override
  Future<List<Transaction>> getRecentTransactions() {
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateTransaction(Transaction t) {
    throw UnimplementedError();
  }
  
  @override
  Future<List<Expense>> getAllExpenses() {
    // TODO: implement getAllExpenses
    throw UnimplementedError();
  }
  
  @override
  Future<List<Income>> getAllIncomes() {
    // TODO: implement getAllIncomes
    throw UnimplementedError();
  }

}
