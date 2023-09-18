import 'package:my_wallet/features/transactions/domain/entities/income.dart';
import 'package:my_wallet/features/transactions/domain/repositories/trans_repository.dart';

class AddInomeUC{
  final TransactionsRepository repository;
  AddInomeUC(this.repository);
  Future<void> call(Income i)async{
    return repository.addIncome(i);
  }
}

