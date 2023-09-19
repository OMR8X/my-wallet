import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';

import '../entities/expense.dart';
import '../repositories/trans_repository.dart';

class AddExpenseUS {
  final TransactionsRepository repository;
  AddExpenseUS(this.repository);
  Future<void> call(Transaction t) async {
    return repository.addTransaction(t);
  }
}
