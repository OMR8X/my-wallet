import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_wallet/core/helpers/localization/app_localization.dart';
import 'package:my_wallet/core/helpers/styles/colors_h.dart';
import 'package:my_wallet/core/helpers/styles/fonts_h.dart';
import 'package:my_wallet/core/helpers/styles/spacing_h.dart';
import 'package:my_wallet/features/transactions/data/data_sources/styles.dart';
import 'package:my_wallet/features/transactions/domain/entities/expense.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';

class CategoriesCircularIndicatorWidget extends StatefulWidget {
  const CategoriesCircularIndicatorWidget(
      {super.key, required this.transaction});

  // all transactions
  final List<Transaction> transaction;

  @override
  State<CategoriesCircularIndicatorWidget> createState() =>
      _CategoriesCircularIndicatorWidgetState();
}

class _CategoriesCircularIndicatorWidgetState
    extends State<CategoriesCircularIndicatorWidget> {
  // store the full amount of money
  double fullAmount = 0.0;
  // collect data
  Map<String, double> data = {};
  // Widget size
  Size? size;
  //
  void initData() {
    data = {};
    fullAmount = 0.0;
    for (var t in widget.transaction) {
      fullAmount += t.amount;
      data[t.category] ??= 0.0; // Initialize to 0.0 if null
      data[t.category] = data[t.category]! + t.amount;
    }
    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initData();
      if (context.size != null) {
        size = context.size!;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CategoriesCircularIndicatorWidget oldWidget) {
    initData();
    super.didUpdateWidget(oldWidget);
  }

  String getTitle() {
    return widget.transaction.runtimeType == (List<Expense>)
        ? "full_${TransactionType.expense.name}".tr(context)
        : "full_${TransactionType.income.name}".tr(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: size?.width,
          height: size?.height,
          child: CustomPaint(
            painter: CategoriesCircularIndicatorPaint(
              data: data,
              fullAmount: fullAmount,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getTitle(),
              style: FontsStylesHelper.textStyle12.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
            SpacingHelper.h1,
            Text(
              "$fullAmount\$",
              style: FontsStylesHelper.textStyle14,
            ),
          ],
        ),
      ],
    );
  }
}

class CategoriesCircularIndicatorPaint extends CustomPainter {
  final Map<String, double> data;
  final double fullAmount;

  CategoriesCircularIndicatorPaint(
      {super.repaint, required this.data, required this.fullAmount});
  @override
  void paint(Canvas canvas, Size size) {
    double lastAngle = 0.0;
    if (data.isEmpty) {
      drawArc(
        lastAngle,
        (2 * pi),
        ColorsHelper.borders,
        canvas,
        size,
      );
    } else {
      data.forEach((key, value) {
        drawArc(
          lastAngle,
          (2 * pi) / (fullAmount / value),
          getStyleByCategory(key).color,
          canvas,
          size,
        );
        lastAngle += (2 * pi) / (fullAmount / value);
      });
    }
  }

  drawArc(double start, double end, Color color, Canvas c, Size s) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeWidth = s.width / 14;
    Rect rect = Rect.fromCenter(
      center: Offset(s.width / 2, s.height / 2),
      width: min(s.width, s.height) * 0.8,
      height: min(s.width, s.height) * 0.8,
    );
    if (color == ExpensesColors.bills) {
      rect = Rect.fromCenter(
        center: Offset(s.width / 2, s.height / 2),
        width: min(s.width, s.height) * 0.8,
        height: min(s.width, s.height) * 0.8,
      );
    }
    c.drawArc(rect, start, end, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
