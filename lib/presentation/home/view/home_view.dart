import 'package:flutter/material.dart';
import 'package:my_wallet/core/helpers/styles/borders_h.dart';
import 'package:my_wallet/core/helpers/styles/colors_h.dart';
import 'package:my_wallet/core/helpers/styles/dividers_helper.dart';
import 'package:my_wallet/core/helpers/styles/fonts_h.dart';
import 'package:my_wallet/core/helpers/styles/radius_h.dart';
import 'package:my_wallet/core/helpers/styles/sizes_h.dart';
import 'package:my_wallet/core/helpers/styles/spacing_h.dart';
import 'package:my_wallet/presentation/home/widgets/home_analysis_w.dart';
import 'package:my_wallet/presentation/home/widgets/home_v_boxes_w.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String balance = "12,000 ل.س";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الرصيد الحالي $balance",
            style: FontsStylesHelper.textStyle10),
      ),
      body: Column(
        children: [
          SpacingHelper.widthExtender,
          SpacingHelper.h4,
          const HomeAnalysisWidget(),
          SpacingHelper.h2,
          const HomeViewBoxesWidgets(),
          SpacingHelper.h2,
          const TransactionsListWidget(),
          SpacingHelper.h4,
        ],
      ),
    );
  }
}

class TransactionsListWidget extends StatelessWidget {
  const TransactionsListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: SizesHelper.mainTileWidth(context),
        child: Column(
          children: [
            SizedBox(
              height: 75,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      // color: Colors.cyan,
                      child: const Center(
                        child: Text(
                          "data",
                          style: FontsStylesHelper.textStyle14,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.orange,
                      child: const Center(
                        child: Text(
                          "data",
                          style: FontsStylesHelper.textStyle14,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            DividerHelper.h1,
            Expanded(
              child: Container(
                height: 90,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
