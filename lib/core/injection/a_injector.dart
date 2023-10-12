import 'package:get_it/get_it.dart';
import 'package:my_wallet/core/injection/sqflite.dart';
import 'package:my_wallet/core/injection/transactions.dart';

final locator = GetIt.instance;
initGetIt() async {
  await injectSqflite();
  await injectTransactions();
}
