import 'package:my_wallet/features/transactions/data/data_sources/transactions_ds.dart';
import 'package:my_wallet/features/transactions/domain/entities/expense.dart';
import 'package:my_wallet/features/transactions/domain/entities/income.dart';
import 'package:my_wallet/features/transactions/domain/repositories/trans_repository.dart';

import '../../domain/entities/transaction.dart';

class TransactionsRepositoryImple implements TransactionsRepository {
  final TransactionDataSource dataSource;
  TransactionsRepositoryImple({required this.dataSource});
  @override
  Future<void> addExpense(Expense e) async {
    return await dataSource.addExpense(e);
  }

  @override
  Future<void> addIncome(Income i) async {
    return await dataSource.addIncome(i);
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