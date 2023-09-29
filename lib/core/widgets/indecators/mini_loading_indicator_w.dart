import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_wallet/core/helpers/styles/colors_h.dart';

class MiniLoadingIndicatorWidget extends StatelessWidget {
  const MiniLoadingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const Center(
          child: CupertinoActivityIndicator(
        radius: 10,
      ));
    }
    return const Center(
        child: CircularProgressIndicator(
      color: ColorsHelper.text1,
    ));
  }
}
