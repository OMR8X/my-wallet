import 'package:sqflite/sqflite.dart';

abstract class TransactionDataSource {
  getLatestTransactions();
}

class TransactionDataSourceImpl implements TransactionDataSource {
  final Database database;
  TransactionDataSourceImpl({required this.database});
  @override
  Future<List<Transaction>> getLatestTransactions() async {
    await database.rawQuery("SELECT * FROM dataBaseName");
    return [];
  }
}
