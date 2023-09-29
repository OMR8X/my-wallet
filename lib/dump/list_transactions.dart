import 'package:my_wallet/features/transactions/data/data_sources/styles.dart';
import 'package:my_wallet/features/transactions/domain/entities/expense.dart';
import 'package:my_wallet/features/transactions/domain/entities/income.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';

List<Transaction> dumpListOfTransaction = [
  Expense(
    id: 0,
    category: "bills",
    transStyle: getStyleByCategory("bills"),
    date: DateTime.now(),
    details: "details",
    amount: 1,
  ),
  Expense(
    id: 0,
    category: "cars",
    transStyle: getStyleByCategory("cars"),
    date: DateTime.now(),
    details: "details",
    amount: 1,
  ),
  Expense(
    id: 0,
    category: "clothes",
    transStyle: getStyleByCategory("clothes"),
    date: DateTime.now(),
    details: "details",
    amount: 1,
  ),
  Expense(
    id: 0,
    category: "communication",
    transStyle: getStyleByCategory("communication"),
    date: DateTime.now(),
    details: "details",
    amount: 1,
  ),
  Expense(
    id: 0,
    category: "health",
    transStyle: getStyleByCategory("health"),
    date: DateTime.now(),
    details: "details",
    amount: 1,
  ),
  Expense(
    id: 0,
    category: "house",
    transStyle: getStyleByCategory("house"),
    date: DateTime.now(),
    details: "details",
    amount: 2,
  ),
  Expense(
    id: 0,
    category: "food_and_drinks",
    transStyle: getStyleByCategory("food_and_drinks"),
    date: DateTime.now(),
    details: "details",
    amount: 4,
  ),
  Expense(
    id: 0,
    category: "entertainment",
    transStyle: getStyleByCategory("entertainment"),
    date: DateTime.now(),
    details: "details",
    amount: 5,
  ),
  Expense(
    id: 0,
    category: "gifts",
    transStyle: getStyleByCategory("gifts"),
    date: DateTime.now(),
    details: "details",
    amount: 7,
  ),
  //
  Expense(
    id: 0,
    category: "transport",
    transStyle: getStyleByCategory("transport"),
    date: DateTime.now(),
    details: "details",
    amount: 7,
  ),
  Expense(
    id: 0,
    category: "shopping",
    transStyle: getStyleByCategory("shopping"),
    date: DateTime.now(),
    details: "details",
    amount: 7,
  ),
  Expense(
    id: 0,
    category: "rent",
    transStyle: getStyleByCategory("rent"),
    date: DateTime.now(),
    details: "details",
    amount: 7,
  ),
  Expense(
    id: 0,
    category: "animals",
    transStyle: getStyleByCategory("animals"),
    date: DateTime.now(),
    details: "details",
    amount: 7,
  ),
  Expense(
    id: 0,
    category: "sport",
    transStyle: getStyleByCategory("sport"),
    date: DateTime.now(),
    details: "details",
    amount: 7,
  ),
  Expense(
    id: 0,
    category: "self_care",
    transStyle: getStyleByCategory("self_care"),
    date: DateTime.now(),
    details: "details",
    amount: 7,
  ),
  Income(
    id: 0,
    category: "private_job",
    transStyle: getStyleByCategory("private_job"),
    date: DateTime.now(),
    details: "details",
    amount: 7,
  ),
  Income(
    id: 0,
    category: "salary",
    transStyle: getStyleByCategory("salary"),
    date: DateTime.now(),
    details: "details",
    amount: 7,
  ),
  Income(
    id: 0,
    category: "expense",
    transStyle: getStyleByCategory("expense"),
    date: DateTime.now(),
    details: "details",
    amount: 25,
  ),
  Income(
    id: 0,
    category: "reward",
    transStyle: getStyleByCategory("reward"),
    date: DateTime.now(),
    details: "details",
    amount: 7,
  ),
  Income(
    id: 0,
    category: "sale",
    transStyle: getStyleByCategory("sale"),
    date: DateTime.now(),
    details: "details",
    amount: 13,
  ),
];
