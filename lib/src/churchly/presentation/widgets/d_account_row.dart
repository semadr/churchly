import 'package:churchly/src/churchly/presentation/widgets/d_account_row_data.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_finance_field.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_icon_button.dart';
import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:flutter/material.dart';

Widget dAccountRow({
  required final BuildContext context,
  required final String item,
  required final String itemLabel,
  required final String price,
  required final String category,
  required final IconData dIcon,
  required final int index,
}) {
  DColors dColors = DColors();
  DFonts dFonts = DFonts();

  return Column(
    children: [
      dAccountRowData(
        dColors: dColors,
        dItem: item,
        dAmount: price,
        dFonts: dFonts,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          dFinanceFormField(
            context: context,
            labelHint: 'Item',
            textInputType: TextInputType.text,
            fWidth: 150.0,
            lPad: 16.0,
            rPad: 0.0,
            fKey: 'pageItem',
            index: index,
            dCart: category,
          ),
          dFinanceFormField(
            context: context,
            labelHint: 'Amount',
            textInputType: TextInputType.number,
            fWidth: 100.0,
            lPad: 8.0,
            rPad: 0.0,
            fKey: 'pageAmount',
            index: index,
            dCart: category,
          ),
          dAddIconButton(
            context: context,
            dIcon: dIcon,
            isKey: 'pageIcon',
            index: index,
            dCart: category,
          ),
        ],
      ),
    ],
  );
}
