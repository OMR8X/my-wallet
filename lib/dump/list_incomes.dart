import 'package:my_wallet/features/transactions/data/data_sources/styles.dart';
import 'package:my_wallet/features/transactions/domain/entities/income.dart';

List<Income> dumpIncomes = [
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
