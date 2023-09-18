import 'package:my_wallet/features/transactions/data/data_sources/styles.dart';
import 'package:my_wallet/features/transactions/domain/entities/expense.dart';

class ExpenseModel extends Expense {
  ExpenseModel({
    required super.category,
    required super.transStyle,
    required super.date,
    required super.details,
    required super.amount,
  });
  factory ExpenseModel.fromJson(Map json) {
    return ExpenseModel(
      category: json["category"],
      transStyle: getStyleByCategory(json["category"]),
      date: DateTime.parse(json["date"]),
      details: json["details"],
      amount: json["amount"],
    );
  }
  toJson() {
    return {
      "category": category,
      "date": date.toString(),
      "details": details,
      "amount": amount,
    };
  }
}
