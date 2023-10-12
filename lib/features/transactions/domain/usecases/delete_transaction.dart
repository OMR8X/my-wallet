import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';
import 'package:my_wallet/features/transactions/domain/repositories/trans_repository.dart';

class DeleteTransactionUS {
  final TransactionsRepository repository;
  DeleteTransactionUS(this.repository);
  Future<void> call(Transaction t) async {
    return repository.deleteTransaction(t);
  }
}
