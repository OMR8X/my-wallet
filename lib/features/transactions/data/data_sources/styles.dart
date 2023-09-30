import 'package:flutter/material.dart';
import 'package:my_wallet/core/helpers/assets/images_h.dart';
import 'package:my_wallet/core/helpers/styles/colors_h.dart';
import 'package:my_wallet/features/transactions/domain/entities/trans_style.dart';

TransStyle getStyleByCategory(String category) {
  switch (category) {
    case "bills":
      return TransStyle(
        icon: ExpensesIcons.bills,
        color: ExpensesColors.bills,
      );
    case "cars":
      return TransStyle(
        icon: ExpensesIcons.cars,
        color: ExpensesColors.cars,
      );
    case "clothes":
      return TransStyle(
        icon: ExpensesIcons.clothes,
        color: ExpensesColors.clothes,
      );
    case "communication":
      return TransStyle(
        icon: ExpensesIcons.communication,
        color: ExpensesColors.communication,
      );
    case "health":
      return TransStyle(
        icon: ExpensesIcons.health,
        color: ExpensesColors.health,
      );
    case "house":
      return TransStyle(
        icon: ExpensesIcons.house,
        color: ExpensesColors.house,
      );
    case "food_and_drinks":
      return TransStyle(
        icon: ExpensesIcons.foodAndDrinks,
        color: ExpensesColors.foodAndDrinks,
      );
    case "entertainment":
      return TransStyle(
        icon: ExpensesIcons.entertainment,
        color: ExpensesColors.entertainment,
      );
    case "gifts":
      return TransStyle(
        icon: ExpensesIcons.gifts,
        color: ExpensesColors.gifts,
      );
    case "transport":
      return TransStyle(
        icon: ExpensesIcons.transport,
        color: ExpensesColors.transport,
      );
    case "shopping":
      return TransStyle(
        icon: ExpensesIcons.shopping,
        color: ExpensesColors.shopping,
      );
    case "rent":
      return TransStyle(
        icon: ExpensesIcons.rent,
        color: ExpensesColors.rent,
      );
    case "animals":
      return TransStyle(
        icon: ExpensesIcons.animals,
        color: ExpensesColors.animals,
      );
    case "sport":
      return TransStyle(
        icon: ExpensesIcons.sport,
        color: ExpensesColors.sport,
      );
    case "self_care":
      return TransStyle(
        icon: ExpensesIcons.selfCare,
        color: ExpensesColors.selfCare,
      );
    case "private_job":
      return TransStyle(
        icon: IncomeIcons.privateJob,
        color: IncomeColors.privateJob,
      );
    case "salary":
      return TransStyle(
        icon: IncomeIcons.salary,
        color: IncomeColors.salary,
      );
    case "expense":
      return TransStyle(
        icon: IncomeIcons.expense,
        color: IncomeColors.expense,
      );
    case "reward":
      return TransStyle(
        icon: IncomeIcons.reward,
        color: IncomeColors.reward,
      );
    case "gifts":
      return TransStyle(
        icon: IncomeIcons.gifts,
        color: IncomeColors.gifts,
      );
    case "sale":
      return TransStyle(
        icon: IncomeIcons.sale,
        color: IncomeColors.sale,
      );
    default:
      return TransStyle(
        icon: "",
        color: Colors.grey,
      );
  }
}
/*
// expenses
bills 0073E6
cars FF6600
clothes FF3399
communication 33CC33
health 0099CC
house FF9933
food_and_drinks FFCC00
entertainment 9900CC
gifts FF99CC
transportation DFBC40
shopping FF0066
rent 3366FF
animals 66CC99
sports FF3333
self_care FF66E6
=======================
// income
private_job FF6600 
salary 0073E6
expense 33CC33
reward FF3399
gifts FF99CC
sale FFCC00
 */