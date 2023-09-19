import 'package:my_wallet/features/transactions/data/models/expense_m.dart';
import 'package:my_wallet/features/transactions/data/models/income_m.dart';
import 'package:my_wallet/features/transactions/data/models/transaction_m.dart';
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
  // Deletes
  Future<void> deleteTransaction(Transaction t);
}

class TransactionDataSourceImpl implements TransactionDataSource {
  final sqflite.Database database;
  final String expensesTable = "expenses_table", incomesTable = "incomes_table";
  TransactionDataSourceImpl({required this.database});

  @override
  Future<(double, double)> getExpensesAndIncomeAmount() async {
    double e = 0.0, i = 0.0;
    var transactions = await getRecentTransactions();
    var expenses = transactions.where(
      (element) => element.runtimeType == Expense,
    );
    var incomes = transactions.where(
      (element) => element.runtimeType == Income,
    );
    for (var exp in expenses) {
      e += exp.amount;
    }
    for (var inc in incomes) {
      e += inc.amount;
    }
    return (e / expenses.length, i / incomes.length);
  }

  @override
  Future<List<Transaction>> getRecentTransactions() async {
    throw UnimplementedError();
  }

  @override
  Future<void> addExpense(e) async {
    var model = ExpenseModel.fromObject(e).toJson();
    await database.insert(expensesTable, model as Map<String, Object?>);
    return;
  }

  @override
  Future<void> addIncome(i) async {
    var model = IncomeModel.fromObject(i).toJson();
    await database.insert(incomesTable, model as Map<String, Object?>);
    return;
  }

  @override
  Future<void> deleteTransaction(Transaction t) async {
    await database.delete(
        t.runtimeType == Expense ? expensesTable : incomesTable,
        where: "id = ?",
        whereArgs: [t.id]);
    return;
  }

  @override
  Future<void> updateTransaction(Transaction t) async {
    Map m = TransactionModel.fromObject(t).toJson();
    await database.update(
        t.runtimeType == Expense ? expensesTable : incomesTable,
        m as Map<String, Object?>,
        where: "id = ?",
        whereArgs: [t.id]);
    return;
  }

  @override
  Future<List<Expense>> getAllExpenses() async {
    List<Map> models = await database.query(expensesTable);
    List<Expense> expenses = [];
    expenses = models.map<Expense>((e) => ExpenseModel.fromJson(e)).toList();
    return expenses;
  }

  @override
  Future<List<Income>> getAllIncomes() async {
    List<Map> models = await database.query(incomesTable);
    List<Income> expenses = [];
    expenses = models.map<Income>((e) => IncomeModel.fromJson(e)).toList();
    return expenses;
  }
}
