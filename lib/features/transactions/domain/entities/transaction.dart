import 'trans_style.dart';

abstract class Transaction {
  final String category;
  final DateTime date;
  final double amount;
  final String details;
  final TransStyle transStyle;
  Transaction({
    required this.transStyle,
    required this.category,
    required this.date,
    required this.details,
    required this.amount,
  });
}
