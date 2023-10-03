import 'package:my_wallet/features/transactions/data/data_sources/styles.dart';
import 'package:my_wallet/features/transactions/domain/entities/income.dart';

class IncomeModel extends Income {
  IncomeModel({
    required super.id,
    required super.category,
    required super.transStyle,
    required super.date,
    required super.details,
    required super.amount,
  });
  factory IncomeModel.fromJson(Map json) {
    return IncomeModel(
      id: json["id"],
      category: json["category"],
      transStyle: getStyleByCategory(json["category"]),
      date: DateTime.parse(json["date"]),
      details: json["details"],
      amount: json["amount"],
    );
  }
  factory IncomeModel.fromObject(Income i) {
    return IncomeModel(
      id: i.id,
      category: i.category,
      transStyle: getStyleByCategory(i.category),
      date: i.date,
      details: i.details,
      amount: i.amount,
    );
  }
  toJson() {
    return {
      "id": id,
      "category": category,
      "date": date.toString(),
      "details": details,
      "amount": amount,
    };
  }
}
