import '../entities/transaction.dart';
import '../repositories/trans_repository.dart';

class UpdateTransactionUS {
  final TransactionsRepository repository;
  UpdateTransactionUS(this.repository);
  Future<void> call(Transaction t) async {
    return repository.updateTransaction(t);
  }
}
