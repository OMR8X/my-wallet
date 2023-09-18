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
  Future<void> addExpense(Expense e);
  // updaters
  Future<void> updateTransaction(Transaction t);
  //Deletes
  Future<void> deleteTransaction(Transaction t);
}

class TransactionDataSourceImpl implements TransactionDataSource {
  final sqflite.Database database;
  final String s1="",s2="";
  TransactionDataSourceImpl({required this.database});
  
  @override
  Future<void> addExpense(e) async{
    await database.rawQuery("sql");
    throw UnimplementedError();
  }
  
  @override
  Future<void> addIncome(i) async{
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteTransaction(Transaction t) async{
    throw UnimplementedError();
  }
  
  @override
  Future<(double, double)> getExpensesAndIncomeAmount() async{
    throw UnimplementedError();
  }
  
  @override
  Future<List<Transaction>> getRecentTransactions() async{
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateTransaction(Transaction t) async{
    throw UnimplementedError();
  }
  
  @override
  Future<List<Expense>> getAllExpenses() async{
    // TODO: implement getAllExpenses
    throw UnimplementedError();
  }
  
  @override
  Future<List<Income>> getAllIncomes() async{
    // TODO: implement getAllIncomes
    throw UnimplementedError();
  }

}
