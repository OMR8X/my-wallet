import 'trans_style.dart';

abstract class Transaction {
  int id;
  String category;
  DateTime date;
  double amount;
  String details;
  TransStyle transStyle;
  Transaction({
    required this.id,
    required this.transStyle,
    required this.category,
    required this.date,
    required this.details,
    required this.amount,
  });
}

enum TransactionType {
  expense,
  income,
}
