import 'package:flutter/material.dart';
import 'package:my_wallet/core/helpers/assets/images_h.dart';
import 'package:my_wallet/core/helpers/styles/colors_h.dart';
import 'package:my_wallet/features/transactions/domain/entities/trans_style.dart';

TransStyle getStyleByCategory(String category) {
  switch (category) {
    case "bills":
      return TransStyle(
        icon: ExpensesIcons.bills,
        color: ExpensesColors.billsColor,
      );
    case "cars":
      return TransStyle(
        icon: ExpensesIcons.cars,
        color: ExpensesColors.carsColor,
      );
    case "clothes":
      return TransStyle(
        icon: ExpensesIcons.clothes,
        color: ExpensesColors.clothesColor,
      );

    case "food_and_drinks":
      return TransStyle(
        icon: ExpensesIcons.foodAndDrink,
        color: ExpensesColors.foodAndDrinkColor,
      );
    case "entertainment":
      return TransStyle(
        icon: ExpensesIcons.entertainment,
        color: ExpensesColors.entertainmentColor,
      );
    case "gifts":
      return TransStyle(
        icon: ExpensesIcons.gifts,
        color: ExpensesColors.giftsColor,
      );
    case "health":
      return TransStyle(
        icon: ExpensesIcons.health,
        color: ExpensesColors.healthColor,
      );
    case "house":
      return TransStyle(
        icon: ExpensesIcons.house,
        color: ExpensesColors.houseColor,
      );
    case "animals":
      return TransStyle(
        icon: ExpensesIcons.animals,
        color: ExpensesColors.animalsColor,
      );
    case "sports":
      return TransStyle(
        icon: ExpensesIcons.sport,
        color: ExpensesColors.shoppingColor,
      );
    case "transport":
      return TransStyle(
        icon: ExpensesIcons.transport,
        color: ExpensesColors.transportColor,
      );
    case "care":
      return TransStyle(
        icon: ExpensesIcons.care,
        color: ExpensesColors.careColor,
      );
    case "shopping":
      return TransStyle(
        icon: ExpensesIcons.shopping,
        color: ExpensesColors.shoppingColor,
      );
    case "private_job":
      return TransStyle(
        icon: IncomeIcons.privateJob,
        color: IncomeColors.privateJob,
      );
    case "salary":
      return TransStyle(
        icon: IncomeIcons.salary,
        color: IncomeColors.salaryColor,
      );
    default:
      return TransStyle(icon: "", color: Colors.grey);
  }
}

// type color
// bills   0073E6
// Cars    FF6600
// clothes  FF3399
// delivery  33CC33
// Food_and_drinks  FFCC00
// entertainment  9900CC
// gifts  FF99CC
// health  0099CC
// house  FF9933
// animals  66CC99
// sports  FF3333
// transport  DFBC40
// care  FF66E6
// shopping  FF0066
// housing  3366FF
// private_job  FF6600
// salary     0073E6
// gifts   FF99CC
// sale    FFCC00
// Expenses  FF3399
// Reward   33CC33