import 'package:my_wallet/features/transactions/domain/entities/income.dart';
import 'package:my_wallet/features/transactions/domain/repositories/trans_repository.dart';

class AddIncomeUC {
  final TransactionsRepository repository;
  AddIncomeUC(this.repository);
  Future<void> call(Income i) async {
    return repository.addIncome(i);
  }
}
