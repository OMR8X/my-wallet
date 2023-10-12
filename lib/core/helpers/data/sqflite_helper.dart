import 'package:dartz/dartz.dart';
import 'package:my_wallet/features/transactions/data/data_sources/transactions_ds.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteInitializer {
  static Future<Database?> initDataBase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "questions_app.db");
    Database db = await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );
    return db;
  }

  //on Create DataBase
  static Future<Unit> onCreate(Database db, int version) async {
    await db.execute(''' CREATE TABLE "expenses_table" (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    category TEXT NOT NULL,
    date TEXT NOT NULL,
    details TEXT NOT NULL, 
    amount REAL NOT NULL
   ) ''');
    await db.execute(''' CREATE TABLE "incomes_table" (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    category TEXT NOT NULL,
    date TEXT NOT NULL,
    details TEXT NOT NULL, 
    amount REAL NOT NULL
   ) ''');

    return unit;
  }

  static Future onUpgrade(Database db, int oldVersion, int newVersion) async {}
}
