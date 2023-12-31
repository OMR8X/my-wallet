import 'package:my_wallet/features/transactions/data/data_sources/styles.dart';
import 'package:my_wallet/features/transactions/domain/entities/expense.dart';
import 'package:my_wallet/features/transactions/domain/entities/income.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';

List<Transaction> dumpListOfTransaction = [
  Expense(
    id: 0,
    category: "bills",
    transStyle: getStyleByCategory("bills"),
    date: DateTime(2023, 10, 3, 11, 30),
    details: "details",
    amount: 1,
  ),
  Expense(
    id: 0,
    category: "cars",
    transStyle: getStyleByCategory("cars"),
    date: DateTime(2023, 10, 3, 12, 56),
    details: "details",
    amount: 1,
  ),
  Expense(
    id: 0,
    category: "clothes",
    transStyle: getStyleByCategory("clothes"),
    date: DateTime(2023, 10, 3, 12, 27),
    details: "details",
    amount: 1,
  ),
  Expense(
    id: 0,
    category: "communication",
    transStyle: getStyleByCategory("communication"),
    date: DateTime(2023, 10, 3, 14, 26),
    details: "details",
    amount: 1,
  ),
  Expense(
    id: 0,
    category: "health",
    transStyle: getStyleByCategory("health"),
    date: DateTime(2023, 10, 3, 14, 33),
    details: "details",
    amount: 1,
  ),
  Expense(
    id: 0,
    category: "house",
    transStyle: getStyleByCategory("house"),
    date: DateTime(2023, 10, 3, 13, 55),
    details: "details",
    amount: 2,
  ),
  Expense(
    id: 0,
    category: "food_and_drinks",
    transStyle: getStyleByCategory("food_and_drinks"),
    date: DateTime(2023, 10, 3, 18, 19),
    details: "details",
    amount: 4,
  ),
  Expense(
    id: 0,
    category: "entertainment",
    transStyle: getStyleByCategory("entertainment"),
    date: DateTime(2023, 10, 3, 15, 12),
    details: "details",
    amount: 5,
  ),
  Expense(
    id: 0,
    category: "gifts",
    transStyle: getStyleByCategory("gifts"),
    date: DateTime(2023, 10, 3, 13, 30),
    details: "details",
    amount: 7,
  ),
  //
  Expense(
    id: 0,
    category: "transport",
    transStyle: getStyleByCategory("transport"),
    date: DateTime(2023, 10, 3, 12, 30),
    details: "details",
    amount: 7,
  ),
  Expense(
    id: 0,
    category: "shopping",
    transStyle: getStyleByCategory("shopping"),
    date: DateTime(2023, 10, 3, 15, 39),
    details: "details",
    amount: 7,
  ),
  Expense(
    id: 0,
    category: "rent",
    transStyle: getStyleByCategory("rent"),
    date: DateTime(2023, 10, 3, 16, 46),
    details: "details",
    amount: 7,
  ),
  Expense(
    id: 0,
    category: "animals",
    transStyle: getStyleByCategory("animals"),
    date: DateTime(2023, 10, 3, 18, 14),
    details: "details",
    amount: 7,
  ),
  Expense(
    id: 0,
    category: "sport",
    transStyle: getStyleByCategory("sport"),
    date: DateTime(2023, 10, 3, 18, 53),
    details: "details",
    amount: 7,
  ),
  Expense(
    id: 0,
    category: "self_care",
    transStyle: getStyleByCategory("self_care"),
    date: DateTime(2023, 10, 3, 18, 41),
    details: "details",
    amount: 7,
  ),
  Income(
    id: 0,
    category: "private_job",
    transStyle: getStyleByCategory("private_job"),
    date: DateTime(2023, 10, 3, 18, 33),
    details: "details",
    amount: 7,
  ),
  Income(
    id: 0,
    category: "salary",
    transStyle: getStyleByCategory("salary"),
    date: DateTime(2023, 10, 3, 12, 30),
    details: "details",
    amount: 7,
  ),
  Income(
    id: 0,
    category: "expense",
    transStyle: getStyleByCategory("expense"),
    date: DateTime(2023, 10, 3, 13, 22),
    details: "details",
    amount: 25,
  ),
  Income(
    id: 0,
    category: "reward",
    transStyle: getStyleByCategory("reward"),
    date: DateTime(2023, 10, 3, 18, 45),
    details: "details",
    amount: 7,
  ),
  Income(
    id: 0,
    category: "sale",
    transStyle: getStyleByCategory("sale"),
    date: DateTime(2023, 10, 3, 15, 12),
    details: "details",
    amount: 13,
  ),
];
