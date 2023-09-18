
import 'package:my_wallet/features/transactions/data/data_sources/styles.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';

class TransactionModel extends Transaction {
  TransactionModel({    required super.id,
    required super.category,
    required super.transStyle,
    required super.date,
    required super.details,
    required super.amount,
  });
  factory TransactionModel.fromJson(Map json) {
    return TransactionModel(
      id: json["id"],
      category: json["category"],
      transStyle: getStyleByCategory(json["category"]),
      date: DateTime.parse(json["date"]),
      details: json["details"],
      amount: json["amount"],
    );
  }
  factory TransactionModel.fromObject(Transaction t) {
    return TransactionModel(
      id: t.id,
      category: t.category,
      transStyle: getStyleByCategory(t.category),
      date: t.date,
      details: t.details,
      amount: t.amount,
    );
  }
  Map toJson() {
    return {
      "id": id,
      "category": category,
      "date": date.toString(),
      "details": details,
      "amount": amount,
    };
  }
}