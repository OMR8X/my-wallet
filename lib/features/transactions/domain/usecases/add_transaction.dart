import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';
import '../repositories/trans_repository.dart';

class AddTransactionUS {
  final TransactionsRepository repository;
  AddTransactionUS(this.repository);
  Future<void> call(Transaction t) async {
    return repository.addTransaction(t);
  }
}
