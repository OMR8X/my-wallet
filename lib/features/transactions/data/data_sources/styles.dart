import 'package:flutter/material.dart';
import 'package:my_wallet/features/transactions/domain/entities/trans_style.dart';

TransStyle getStyleByCategory(String category) {
  switch (category) {
    case "bills":
      return TransStyle(icon: "icon", color: const Color(0xff0073E6));
    case "cars":
      return TransStyle(icon: "icon", color: const Color(0xffFF6600));
    case "clothes":
      return TransStyle(icon: "icon", color: const Color(0xffFF3399));
    case "delivery":
      return TransStyle(icon: "icon", color: const Color(0xff33CC33));
    case "food_and_drinks":
      return TransStyle(icon: "icon", color: const Color(0xffFFCC00));
    case "entertainment":
      return TransStyle(icon: "icon", color: const Color(0xff9900CC));
    case "gifts":
      return TransStyle(icon: "icon", color: const Color(0xffFF99CC));
    case "health":
      return TransStyle(icon: "icon", color: const Color(0xff0099CC));
    case "house":
      return TransStyle(icon: "icon", color: const Color(0xffFF9933));
    case "animals":
      return TransStyle(icon: "icon", color: const Color(0xff66CC99));
    case "sports":
      return TransStyle(icon: "icon", color: const Color(0xffFF3333));
    case "transport":
      return TransStyle(icon: "icon", color: const Color(0xffDFBC40));
    case "care":
      return TransStyle(icon: "icon", color: const Color(0xffFF66E6));
    case "shopping":
      return TransStyle(icon: "icon", color: const Color(0xffFF0066));
    case "housing":
      return TransStyle(icon: "icon", color: const Color(0xff3366FF));
    case "private_job":
      return TransStyle(icon: "icon", color: const Color(0xffFF6600));
    case "salary":
      return TransStyle(icon: "icon", color: const Color(0xff0073E6));
    default:
       return TransStyle(icon: "icon", color: Colors.grey);
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