import 'package:flutter/material.dart';
import 'package:my_wallet/features/transactions/domain/entities/trans_style.dart';

getStyleByCategory(String category) {
  if (category.contains("bills")) {
    return TransStyle(icon: "icon", color: const Color(0xff0073E6));
  }
  if (category.contains("cars")) {
    return TransStyle(icon: "icon", color: const Color(0xffFF6600));
  }
  if (category.contains("clothes")) {
    return TransStyle(icon: "icon", color: const Color(0xffFF3399));
  }
  if (category.contains("delivery")) {
    return TransStyle(icon: "icon", color: const Color(0xff33CC33));
  }
  if (category.contains("food_and_drinks")) {
    return TransStyle(icon: "icon", color: const Color(0xffFFCC00));
  }
  if (category.contains("entertainment")) {
    return TransStyle(icon: "icon", color: const Color(0xff9900CC));
  }
  if (category.contains("gifts")) {
    return TransStyle(icon: "icon", color: const Color(0xffFF99CC));
  }
  if (category.contains("health")) {
    return TransStyle(icon: "icon", color: const Color(0xff0099CC));
  }
  if (category.contains("house")) {
    return TransStyle(icon: "icon", color: const Color(0xffFF9933));
  }
  if (category.contains("animals")) {
    return TransStyle(icon: "icon", color: const Color(0xff66CC99));
  }
  if (category.contains("sports")) {
    return TransStyle(icon: "icon", color: const Color(0xffFF3333));
  }
  if (category.contains("transport")) {
    return TransStyle(icon: "icon", color: const Color(0xffDFBC40));
  }
  if (category.contains("care")) {
    return TransStyle(icon: "icon", color: const Color(0xffFF66E6));
  }
  if (category.contains("shopping")) {
    return TransStyle(icon: "icon", color: const Color(0xffFF0066));
  }
  if (category.contains("housing")) {
    return TransStyle(icon: "icon", color: const Color(0xff3366FF));
  }
  //
  if (category.contains("private_job")) {
    return TransStyle(icon: "icon", color: const Color(0xffFF6600));
  }
  if (category.contains("salary")) {
    return TransStyle(icon: "icon", color: const Color(0xff0073E6));
  }
  if (category.contains("gifts")) {
    return TransStyle(icon: "icon", color: const Color(0xffFF99CC));
  }
  if (category.contains("sale")) {
    return TransStyle(icon: "icon", color: const Color(0xffFFCC00));
  }
  if (category.contains("expenses")) {
    return TransStyle(icon: "icon", color: const Color(0xffFF3399));
  }
  if (category.contains("reward")) {
    return TransStyle(icon: "icon", color: const Color(0xff33CC33));
  }
//
  return TransStyle(icon: "icon", color: Colors.grey);
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