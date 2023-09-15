import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';

class Income extends Transaction {
  Income({
    required super.transStyle,
    required super.date,
    required super.details,
    required super.amount,
  });
}
