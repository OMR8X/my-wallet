import 'package:my_wallet/core/injection/a_injector.dart';
import 'package:my_wallet/features/transactions/data/data_sources/transactions_ds.dart';
import 'package:my_wallet/features/transactions/data/repositories/repository_impl.dart';
import 'package:my_wallet/features/transactions/domain/repositories/trans_repository.dart';
import 'package:my_wallet/features/transactions/domain/usecases/add_transaction.dart';
import 'package:my_wallet/features/transactions/domain/usecases/delete_transaction.dart';
import 'package:my_wallet/features/transactions/domain/usecases/get_all_expenses.dart';
import 'package:my_wallet/features/transactions/domain/usecases/get_all_incomes.dart';
import 'package:my_wallet/features/transactions/domain/usecases/get_expense_ans_incomes_amount.dart';
import 'package:my_wallet/features/transactions/domain/usecases/get_last_transactions.dart';
import 'package:my_wallet/features/transactions/domain/usecases/get_recent_transactions.dart';
import 'package:my_wallet/features/transactions/domain/usecases/update_transaction.dart';

injectTransactions() async {
  await injectDataSources();
  await injectRepositories();
  await injectUserCases();
}

Future<void> injectUserCases() async {
  locator.registerFactory<AddTransactionUS>(() => AddTransactionUS(locator()));
  locator.registerFactory<DeleteTransactionUS>(
      () => DeleteTransactionUS(locator()));
  locator.registerFactory<GetAllExpensesUS>(() => GetAllExpensesUS(locator()));
  locator.registerFactory<GetAllIncomesUS>(() => GetAllIncomesUS(locator()));
  locator.registerFactory<GetExpenseAndIncomesAmountUS>(
      () => GetExpenseAndIncomesAmountUS(locator()));
  locator.registerFactory<GetLastTransactionsUS>(
      () => GetLastTransactionsUS(locator()));
  locator.registerFactory<GetRecentTransactionsUS>(
      () => GetRecentTransactionsUS(locator()));
  locator.registerFactory<UpdateTransactionUS>(
      () => UpdateTransactionUS(locator()));
}

Future<void> injectRepositories() async {
  locator.registerFactory<TransactionsRepository>(
    () => TransactionsRepositoryImpel(dataSource: locator()),
  );
}

Future<void> injectDataSources() async {
  locator.registerFactory<TransactionDataSource>(
    () => TransactionDataSourceImpl(database: locator()),
  );
}

Future<void> injectInstances() async {}
