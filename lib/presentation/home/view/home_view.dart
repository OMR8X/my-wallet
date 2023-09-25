import 'package:flutter/material.dart';
import 'package:my_wallet/core/helpers/styles/fonts_h.dart';
import 'package:my_wallet/core/helpers/styles/spacing_h.dart';
import 'package:my_wallet/presentation/home/widgets/home_analysis_w.dart';

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
        title: Text("الرصيد الحالي $balance", style: FontStyleHelper.bold),
      ),
      body: Column(
        children: [
          SpacingHelper.widthExtender,
          SpacingHelper.h4,
          const HomeAnalysisWidget(),
        ],
      ),
    );
  }
}
