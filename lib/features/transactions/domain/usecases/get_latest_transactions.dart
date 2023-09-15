import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';
import 'package:my_wallet/features/transactions/domain/repositories/trans_repository.dart';

class GetLatestTransactions {
  final TransactionsRepository repository;

  GetLatestTransactions(this.repository);

  Future<List<Transaction>> call() async{
    return await repository.getLatestTransactions();
  }
}