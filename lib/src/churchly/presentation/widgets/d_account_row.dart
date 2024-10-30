import 'package:churchly/src/churchly/presentation/widgets/d_account_row_data.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_finance_field.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_icon_button.dart';
import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:flutter/material.dart';

class DAccountRow extends StatelessWidget {
  final String item;
  final String itemLabel;
  final String price;
  final String category;
  final IconData dIcon;
  final int index;

  const DAccountRow({
    super.key,
    required this.item,
    required this.itemLabel,
    required this.price,
    required this.category,
    required this.dIcon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    DColors dColors = DColors();
    DFonts dFonts = DFonts();

    return Column(
      children: [
        DAccountRowData(
          dColors: dColors,
          dItem: item,
          dAmount: price,
          dFonts: dFonts,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DFinanceFormField(
              labelHint: 'Item',
              textInputType: TextInputType.text,
              fWidth: 150.0,
              lPad: 16.0,
              rPad: 0.0,
              fKey: 'pageItem',
              index: index,
              dCart: category,
            ),
            DFinanceFormField(
              labelHint: 'Amount',
              textInputType: TextInputType.number,
              fWidth: 100.0,
              lPad: 8.0,
              rPad: 0.0,
              fKey: 'pageAmount',
              index: index,
              dCart: category,
            ),
            DAddIconButton(
              dIcon: dIcon,
              isKey: '',
              index: index,
              dCart: category,
            ),
          ],
        ),
      ],
    );
  }
}
