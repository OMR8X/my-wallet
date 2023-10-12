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
  Future<List<Transaction>> getLastTransactions();
  Future<List<Income>> getAllIncomes();
  Future<List<Expense>> getAllExpenses();
  Future<(double, double)> getExpensesAndIncomeAmount();
  // Adders
  Future<void> addTransaction(Transaction t);

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
    for (var t in transactions) {
      if (t.runtimeType == Expense) {
        e += t.amount;
      } else {
        i += t.amount;
      }
    }
    return (e, i);
  }

  @override
  Future<List<Transaction>> getRecentTransactions() async {
    int d, m, y;
    d = DateTime.now().day;
    m = DateTime.now().month;
    y = DateTime.now().year;
    List<Transaction> transactions = await getAllTransactions();
    return transactions.where((element) {
      if (element.date.year != y) return false;
      if (element.date.month != m) return false;
      if (element.date.day != d) return false;
      return true;
    }).toList();
  }

  @override
  Future<List<Transaction>> getLastTransactions() async {
    List<Transaction> transactions = await getAllTransactions();
    if (transactions.length < 10) return transactions;
    return transactions.sublist(transactions.length - 10, transactions.length);
  }

  @override
  Future<void> addTransaction(t) async {
    var model = TransactionModel.fromObject(t).toJson();
    model.remove("id");
    await database.insert(
      t.runtimeType == Expense ? expensesTable : incomesTable,
      model,
    );
    return;
  }

  @override
  Future<void> deleteTransaction(Transaction t) async {
    await database.delete(
      t is Expense ? expensesTable : incomesTable,
      where: "id = ?",
      whereArgs: [t.id],
    );
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
    expenses.sort((a, b) => b.date.compareTo(a.date));
    expenses.reversed;
    return expenses;
  }

  @override
  Future<List<Income>> getAllIncomes() async {
    List<Map> models = await database.query(incomesTable);
    List<Income> incomes = [];
    incomes = models.map<Income>((e) => IncomeModel.fromJson(e)).toList();
    incomes.sort((a, b) => b.date.compareTo(a.date));
    incomes.reversed;
    return incomes;
  }

  Future<List<Transaction>> getAllTransactions() async {
    List<Transaction> transactions = [];
    transactions += await getAllExpenses();
    transactions += await getAllIncomes();
    transactions.sort((a, b) => b.date.compareTo(a.date));
    return transactions;
  }
}
