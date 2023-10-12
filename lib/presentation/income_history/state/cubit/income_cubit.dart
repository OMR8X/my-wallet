import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_wallet/core/injection/a_injector.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';
import 'package:my_wallet/features/transactions/domain/usecases/delete_transaction.dart';
import 'package:my_wallet/features/transactions/domain/usecases/get_all_incomes.dart';

part 'income_state.dart';

class IncomeCubit extends Cubit<IncomeState> {
  IncomeCubit() : super(IncomeLoading());
  final GetAllIncomesUS getAllIncomesUS = locator();
  final DeleteTransactionUS deleteTransactionUC = locator();
  getTransactions() async {
    emit(IncomeLoading());
    List<Transaction> transactions = [];
    transactions = await getAllIncomesUS();

    emit(IncomeInitial(transactions: transactions));
  }

  deleteTransaction(Transaction t) async {
    await deleteTransactionUC.call(t);
    getTransactions();
  }
}
