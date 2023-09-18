import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';

class Expense extends Transaction {
  Expense({
        required super.id,
    required super.category,
    required super.date,
    required super.transStyle,
    required super.details,
    required super.amount,
  });
}
