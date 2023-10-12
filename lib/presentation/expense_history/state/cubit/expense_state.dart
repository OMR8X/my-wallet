part of 'expense_cubit.dart';

sealed class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  List<Object> get props => [];
}

final class ExpenseLoading extends ExpenseState {}

final class ExpenseInitial extends ExpenseState {
  final List<Transaction> transactions;

  const ExpenseInitial({required this.transactions});
  @override
  List<Object> get props => [transactions];
}
