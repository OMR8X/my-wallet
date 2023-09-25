import '../repositories/trans_repository.dart';
import '../entities/transaction.dart';

class GetLastTransactionsUS {
  final TransactionsRepository repository;
  GetLastTransactionsUS(this.repository);
  Future<List<Transaction>> call() async {
    return await repository.getLastTransactions();
  }
}
