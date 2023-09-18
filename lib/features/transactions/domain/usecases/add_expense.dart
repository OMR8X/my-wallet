import '../entities/expense.dart';
import '../repositories/trans_repository.dart';

class AddExpenseUS{
  final TransactionsRepository repository;
  AddExpenseUS(this.repository);
  Future<void> call(Expense e)async{
    return repository.addExpense(e);
  }
}