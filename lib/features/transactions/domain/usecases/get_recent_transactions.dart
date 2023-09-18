import '../repositories/trans_repository.dart';
import '../entities/transaction.dart';

class GetRecentTranactionsUS {
  final TransactionsRepository repository;

  GetRecentTranactionsUS(this.repository);
  Future<List<Transaction>> call() async {
    return await repository.getRecentTransactions();
  }
}
