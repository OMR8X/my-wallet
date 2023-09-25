import 'package:my_wallet/features/transactions/data/data_sources/transactions_ds.dart';
import 'package:my_wallet/features/transactions/domain/entities/expense.dart';
import 'package:my_wallet/features/transactions/domain/entities/income.dart';
import 'package:my_wallet/features/transactions/domain/repositories/trans_repository.dart';

import '../../domain/entities/transaction.dart';

class TransactionsRepositoryImpel implements TransactionsRepository {
  final TransactionDataSource dataSource;
  TransactionsRepositoryImpel({required this.dataSource});
  @override
  Future<void> addTransaction(Transaction t) async{
    return await dataSource.addTransaction(t);
  }

  @override
  Future<List<Transaction>> getLastTransactions() async{
    return await dataSource.getLastTransactions();
  }

  @override
  Future<void> deleteTransaction(Transaction t) async {
    return await dataSource.deleteTransaction(t);
  }

  @override
  Future<List<Expense>> getAllExpenses() async {
    return await dataSource.getAllExpenses();
  }

  @override
  Future<List<Income>> getAllIncomes() async {
    return await dataSource.getAllIncomes();
  }

  @override
  Future<(double, double)> getExpensesAndIncomeAmount() async {
    return await dataSource.getExpensesAndIncomeAmount();
  }

  @override
  Future<List<Transaction>> getRecentTransactions() async {
    return await dataSource.getRecentTransactions();
  }

  @override
  Future<void> updateTransaction(Transaction t) async {
    throw UnimplementedError();
  }
}
