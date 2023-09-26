import 'package:flutter/material.dart';
import 'package:my_wallet/core/helpers/styles/dividers_helper.dart';
import 'package:my_wallet/core/helpers/styles/fonts_h.dart';
import 'package:my_wallet/core/helpers/styles/sizes_h.dart';

class HomeTransactionsListWidget extends StatelessWidget {
  const HomeTransactionsListWidget({
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
