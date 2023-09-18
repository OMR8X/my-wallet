import 'package:my_wallet/features/transactions/domain/entities/income.dart';
import '../repositories/trans_repository.dart';

class GetAllIncomesUS {
  final TransactionsRepository repository;
  GetAllIncomesUS(this.repository);
  Future<List<Income>> call() async {
    return await repository.getAllIncomes();
  }
}
