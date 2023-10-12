part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeLoading extends HomeState {}

final class HomeTransactions extends HomeState {
  final double balance, income, expense;
  final List<Transaction> transactions;
  final TransactionType currentType;

  const HomeTransactions({
    required this.balance,
    required this.income,
    required this.expense,
    required this.transactions,
    required this.currentType,
  });
  @override
  List<Object> get props => [
        balance,
        income,
        expense,
        transactions,currentType
      ];
}
