import 'package:my_wallet/core/helpers/data/sqflite_helper.dart';
import 'package:my_wallet/core/injection/a_injector.dart';
import 'package:my_wallet/features/transactions/data/data_sources/transactions_ds.dart';
import 'package:sqflite/sqflite.dart';

injectSqflite() async {
  await injectDataSources();
}

Future<void> injectDataSources() async {
  Database? database = await SqfliteInitializer.initDataBase();
  locator.registerFactory<Database>(
    () => database!,
  );
}
