import 'package:my_wallet/features/transactions/domain/repositories/trans_repository.dart';

import '../entities/transaction.dart';

class GetRecentTransactionsUS {
  final TransactionsRepository repository;
  GetRecentTransactionsUS(this.repository);
  Future<List<Transaction>> call() async {
    return await repository.getRecentTransactions();
  }
}
