import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';

class Expense extends Transaction {
  Expense({
    required super.transStyle,
    required super.date,
    required super.details,
    required super.amount,
  });
}
