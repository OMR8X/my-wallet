import '../repositories/trans_repository.dart';

class GetExpenseAndIncomesAmountUS {
  final TransactionsRepository repository;
  GetExpenseAndIncomesAmountUS(this.repository);
  Future<(double, double)> call() async {
    return await repository.getExpensesAndIncomeAmount();
  }
}