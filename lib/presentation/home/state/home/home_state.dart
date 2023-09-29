part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeLoading extends HomeState {}

final class HomeIncomes extends HomeState {
  final double balance, income, expense;
  final List<Income> incomes;
  final (Map<String, List<Transaction>>, double) incomesCategoriesAmounts;

  const HomeIncomes({
    required this.balance,
    required this.income,
    required this.expense,
    required this.incomes,
    required this.incomesCategoriesAmounts,
  });
  @override
  List<Object> get props => [
        balance,
        income,
        expense,
        incomes,
        incomesCategoriesAmounts,
      ];
}

final class HomeExpenses extends HomeState {
  final double balance, income, expense;
  final List<Expense> expenses;
  final (Map<String, List<Transaction>>, double) expenseCategoriesAmounts;

  const HomeExpenses({
    required this.balance,
    required this.income,
    required this.expense,
    required this.expenses,
    required this.expenseCategoriesAmounts,
  });
  @override
  List<Object> get props => [
        balance,
        income,
        expense,
        expenses,
        expenseCategoriesAmounts,
      ];
}
