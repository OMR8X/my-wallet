import 'trans_style.dart';

abstract class Transaction {
  final DateTime date;
  final double amount;
  final String details;
  final TransStyle transStyle;
  Transaction({
    required this.transStyle,
    required this.date,
    required this.details,
    required this.amount,
  });
}
