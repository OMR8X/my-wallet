import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_wallet/core/injection/a_injector.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';
import 'package:my_wallet/features/transactions/domain/usecases/delete_transaction.dart';
import 'package:my_wallet/features/transactions/domain/usecases/get_all_expenses.dart';

part 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit() : super(ExpenseLoading());
  final GetAllExpensesUS getAllExpenses = locator();
  final DeleteTransactionUS deleteTransactionUC = locator();
  getTransactions() async {
    emit(ExpenseLoading());
    List<Transaction> transactions = [];
    transactions = await getAllExpenses();
    emit(ExpenseInitial(transactions: transactions));
  }

  deleteTransaction(Transaction t) async {
    await deleteTransactionUC.call(t);
    getTransactions();
  }
}
