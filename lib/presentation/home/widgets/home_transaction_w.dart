import 'package:flutter/material.dart';

import '../../../core/helpers/styles/colors_h.dart';
import '../../../core/helpers/styles/sizes_h.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    super.key,
  });

  //final int operations;
  //final double amount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizesHelper.mainTileWidth(context),
      height: 70,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: CircleAvatar(
                      radius: 28,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'الايجار',
                        style: TextStyle(
                          color: ColorsHelper.text2,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'عملية ',
                        style: TextStyle(
                          color: ColorsHelper.text2,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              '2300',
              style: TextStyle(
                color: ColorsHelper.text2,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
