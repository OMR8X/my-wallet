import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_wallet/core/helpers/styles/spacing_h.dart';
import 'package:my_wallet/core/widgets/indecators/categories_circular_indicator_widget.dart';
import 'package:my_wallet/features/transactions/data/data_sources/styles.dart';
import 'package:my_wallet/features/transactions/data/models/transaction_m.dart';
import 'package:my_wallet/features/transactions/domain/entities/trans_style.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const MyWallet());
}

class MyWallet extends StatelessWidget {
  const MyWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color(0xff0E0E0E)),
      home: const HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpacingHelper.widthExtender,
          CategoriesCircularIndicatorWidget(
            size: MediaQuery.sizeOf(context),
            transaction: [
              TransactionModel(
                id: 0,
                category: "bills",
                transStyle: getStyleByCategory("bills"),
                date: DateTime.now(),
                details: "details",
                amount: 1,
              ),
              TransactionModel(
                id: 0,
                category: "cars",
                transStyle: getStyleByCategory("cars"),
                date: DateTime.now(),
                details: "details",
                amount: 2,
              ),
              TransactionModel(
                id: 0,
                category: "clothes",
                transStyle: getStyleByCategory("clothes"),
                date: DateTime.now(),
                details: "details",
                amount: 4,
              ),
              TransactionModel(
                id: 0,
                category: "delivery",
                transStyle: getStyleByCategory("delivery"),
                date: DateTime.now(),
                details: "details",
                amount: 5,
              ),
              TransactionModel(
                id: 0,
                category: "food_and_drinks",
                transStyle: getStyleByCategory("food_and_drinks"),
                date: DateTime.now(),
                details: "details",
                amount: 7,
              ),
            ],
          )
        ],
      ),
    );
  }
}
