import 'package:my_wallet/features/transactions/data/data_sources/styles.dart';
import 'package:my_wallet/features/transactions/domain/entities/expense.dart';

class ExpenseModel extends Expense {
  ExpenseModel({
    required super.id,
    required super.category,
    required super.transStyle,
    required super.date,
    required super.details,
    required super.amount,
  });
  factory ExpenseModel.fromJson(Map json) {
    return ExpenseModel(
      id: json["id"],
      category: json["category"],
      transStyle: getStyleByCategory(json["category"]),
      date: DateTime.parse(json["date"]),
      details: json["details"],
      amount: json["amount"],
    );
  }
  factory ExpenseModel.fromObject(Expense e) {
    return ExpenseModel(
      id: e.id,
      category: e.category,
      transStyle: getStyleByCategory(e.category),
      date: e.date,
      details: e.details,
      amount: e.amount,
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
