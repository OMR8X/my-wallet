part of 'income_cubit.dart';

sealed class IncomeState extends Equatable {
  const IncomeState();

  @override
  List<Object> get props => [];
}

final class IncomeLoading extends IncomeState {}
final class IncomeInitial extends IncomeState {
  final List<Transaction> transactions;

  const IncomeInitial({required this.transactions});

  @override
  List<Object> get props => [transactions];
}
