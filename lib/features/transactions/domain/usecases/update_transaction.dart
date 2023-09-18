import '../entities/transaction.dart';
import '../repositories/trans_repository.dart';

class UpdateTransaction {
  final TransactionsRepository repository;
  UpdateTransaction(this.repository);
  Future<void> call(Transaction t) async {
    return repository.updateTransaction(t);
  }
}
