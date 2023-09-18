import 'package:my_wallet/features/transactions/domain/entities/expense.dart';
import '../repositories/trans_repository.dart';

class GetAllExpensesUS {
  final TransactionsRepository repository;
  GetAllExpensesUS(this.repository);
  Future<List<Expense>> call() async {
    return await repository.getAllExpenses();
  }
}
