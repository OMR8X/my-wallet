import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_wallet/core/helpers/localization/app_localization.dart';
import 'package:my_wallet/core/helpers/styles/colors_h.dart';
import 'package:my_wallet/core/helpers/styles/fonts_h.dart';
import 'package:my_wallet/core/helpers/styles/radius_h.dart';
import 'package:my_wallet/core/helpers/styles/sizes_h.dart';
import 'package:my_wallet/core/helpers/styles/spacing_h.dart';
import 'package:my_wallet/dump/list_expenses.dart';
import 'package:my_wallet/dump/list_incomes.dart';
import 'package:my_wallet/features/transactions/domain/entities/transaction.dart';

class HomeBottomSheet extends StatefulWidget {
  const HomeBottomSheet({super.key, required this.onAdd});
  final Function(Transaction t) onAdd;
  @override
  State<HomeBottomSheet> createState() => _HomeBottomSheetState();
}

class _HomeBottomSheetState extends State<HomeBottomSheet> {
  bool didPickCategory = false;
  late Transaction transaction;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      builder: (context, scrollController) => Container(
        color: ColorsHelper.background,
        child: didPickCategory
            ? StateTwoWidget(onInput: (double amount) {
                widget.onAdd(transaction..amount = amount);
              })
            : StateOneWidget(
                scrollController: scrollController,
                onPick: (Transaction t) {
                  setState(() {
                    transaction = t;
                    didPickCategory = true;
                  });
                },
              ),
      ),
    );
  }
}

class StateOneWidget extends StatefulWidget {
  const StateOneWidget({
    super.key,
    required this.scrollController,
    required this.onPick,
  });
  final ScrollController scrollController;
  final Function(Transaction) onPick;
  @override
  State<StateOneWidget> createState() => _StateOneWidgetState();
}

class _StateOneWidgetState extends State<StateOneWidget> {
  String t1 = "دخل", t2 = "خرج", t3 = "التالي";
  String selected = "دخل";
  int index = -1;
  List<Transaction> transaction = [];
  late Transaction selectedTransaction;
  @override
  initState() {
    getIncomesCategories();
    super.initState();
  }

  getIncomesCategories() {
    transaction = dumpIncomes;
    index = -1;
  }

  getExpensesCategories() {
    transaction = dumpExpenses;
    index = -1;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: SizesHelper.radius / 2),
      controller: widget.scrollController,
      children: [
        SpacingHelper.h5,
        SizedBox(
          width: SizesHelper.mainTileWidth(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    selected = t1;
                    getIncomesCategories();
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selected == t1 ? Colors.cyan : null,
                  ),
                  child: Text(t1),
                ),
              ),
              SpacingHelper.w3,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    selected = t2;
                    getExpensesCategories();
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selected == t2 ? Colors.cyan : null,
                  ),
                  child: Text(t2),
                ),
              ),
            ],
          ),
        ),
        SpacingHelper.h5,
        SizedBox(
          child: GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              crossAxisCount: 4,
              // childAspectRatio: 3 / 4,
            ),
            itemCount: transaction.length,
            itemBuilder: (context, i) => HomeBottomSheetItemWidget(
              transaction: transaction[i],
              isSelected: index == i,
              onTap: () {
                setState(() {
                  index = i;
                  selectedTransaction = transaction[i];
                });
              },
            ),
          ),
        ),
        SpacingHelper.h2,
        SizedBox(
          height: 50,
          width: SizesHelper.mainTileWidth(context),
          child: index == -1
              ? const SizedBox()
              : ElevatedButton(
                  onPressed: () {
                    widget.onPick(selectedTransaction);
                  },
                  style: ElevatedButton.styleFrom(),
                  child: Text(t3),
                ),
        ),
      ],
    );
  }
}

class StateTwoWidget extends StatefulWidget {
  const StateTwoWidget({
    super.key,
    required this.onInput,
  });
  final Function(double amount) onInput;
  @override
  State<StateTwoWidget> createState() => _StateTwoWidgetState();
}

class _StateTwoWidgetState extends State<StateTwoWidget> {
  String t1 = "اضافة";
  double amount = 0.0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizesHelper.mainTileWidth(context),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SpacingHelper.widthExtender,
            SpacingHelper.h5,
            SizedBox(
              width: SizesHelper.mainTileWidth(context),
              child: TextFormField(
                textAlign: TextAlign.center,
                style: FontsStylesHelper.textStyle40.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
                onSaved: (String? newValue) {
                  setState(() {
                    amount = double.parse(newValue!);
                  });
                },
                validator: (value) {
                  RegExp numericRegExp = RegExp(r'^[0-9]+$');
                  if (value == null) {
                    return "لا يمكن ان يكون الحقل فارغ";
                  }
                  String newValue = value.trim();
                  if (!(numericRegExp.hasMatch(newValue))) {
                    return "استخدم فقط و الارقام";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: RadiusHelper.r2,
                  ),
                  hintText: " 999\$ ",
                  hintStyle: FontsStylesHelper.textStyle40.copyWith(
                    color: ColorsHelper.text3,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: ColorsHelper.borders,
                  )),
                ),
              ),
            ),
            SpacingHelper.h5,
            SizedBox(
              width: SizesHelper.mainTileWidth(context),
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  bool value = formKey.currentState?.validate() ?? false;
                  if (value) {
                    formKey.currentState?.save();
                    widget.onInput(amount);
                    Navigator.of(context).pop();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsHelper.borders,
                ),
                child: Text(t1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeBottomSheetItemWidget extends StatelessWidget {
  const HomeBottomSheetItemWidget({
    super.key,
    required this.transaction,
    required this.onTap,
    required this.isSelected,
  });

  final Transaction transaction;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.cyan : Colors.transparent,
          ),
          borderRadius: RadiusHelper.r2),
      child: InkWell(
        radius: 20,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: transaction.transStyle.color,
              child: SvgPicture.asset(
                transaction.transStyle.icon,
              ),
            ),
            SpacingHelper.h2,
            SizedBox(
              child: Text(
                transaction.category.tr(context),
                style: FontsStylesHelper.textStyle10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
