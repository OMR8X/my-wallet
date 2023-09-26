import 'package:flutter/material.dart';
import 'package:my_wallet/features/transactions/domain/entities/trans_style.dart';

TransStyle getStyleByCategory(String category) {
  String baseExpensePath = "assets/icons/expense/";
  String baseIncomePath = "assets/icons/income/";
  switch (category) {
    case "bills":
      return TransStyle(
        icon: "$baseExpensePath bills.svg",
        color: const Color(0xff0073E6),
      );
    case "cars":
      return TransStyle(
        icon: "$baseExpensePath cars.svg",
        color: const Color(0xffFF6600),
      );
    case "clothes":
      return TransStyle(
        icon: "$baseExpensePath clothes.svg",
        color: const Color(0xffFF3399),
      );

    case "food_and_drinks":
      return TransStyle(
        icon: "$baseExpensePath food&drinks.svg",
        color: const Color(0xffFFCC00),
      );
    case "entertainment":
      return TransStyle(
        icon: "$baseExpensePath entertainment.svg",
        color: const Color(0xff9900CC),
      );
    case "gifts":
      return TransStyle(
        icon: "$baseExpensePath gifts.svg",
        color: const Color(0xffFF99CC),
      );
    case "health":
      return TransStyle(
        icon: "$baseExpensePath health.svg",
        color: const Color(0xff0099CC),
      );
    case "house":
      return TransStyle(
        icon: "$baseExpensePath house.svg",
        color: const Color(0xffFF9933),
      );
    case "animals":
      return TransStyle(
        icon: "$baseExpensePath animals.svg",
        color: const Color(0xff66CC99),
      );
    case "sports":
      return TransStyle(
        icon: "$baseExpensePath sport.svg",
        color: const Color(0xffFF3333),
      );
    case "transport":
      return TransStyle(
        icon: "$baseExpensePath transport.svg",
        color: const Color(0xffDFBC40),
      );
    case "care":
      return TransStyle(
        icon: "$baseExpensePath care.svg",
        color: const Color(0xffFF66E6),
      );
    case "shopping":
      return TransStyle(
        icon: "$baseExpensePath shopping.svg",
        color: const Color(0xffFF0066),
      );
    case "private_job":
      return TransStyle(
        icon: "$baseIncomePath private_job.svg",
        color: const Color(0xffFF6600),
      );
    case "salary":
      return TransStyle(
        icon: "$baseIncomePath salary.svg",
        color: const Color(0xff0073E6),
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