import 'package:churchly/src/churchly/presentation/widgets/d_continue_button.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_finance_field.dart';
import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:flutter/material.dart';

Widget dFinanceDialog({
  required final BuildContext context,
  required final String dCart,
}) {
  DFonts dFonts = DFonts();
  DColors dColors = DColors();

  return Center(
    child: SizedBox(
      width: double.infinity,
      height: 650,
      child: AlertDialog(
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Insert Finance Item',
              style: TextStyle(
                fontSize: dFonts.dFontBody1Size,
                color: dColors.dBlackColor,
                fontWeight: dFonts.dFontBodyWeight,
              ),
            ),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.clear,
                color: dColors.dSecondaryColor,
              ),
            ),
          ],
        ),
        content: Column(
          children: [
            dFinanceFormField(
              context: context,
              labelHint: 'Item name',
              textInputType: TextInputType.text,
              fWidth: double.infinity,
              lPad: 12.0,
              rPad: 12.0,
              fKey: 'dialogItem',
              index: 0,
              dCart: dCart,
            ),
            dFinanceFormField(
              context: context,
              labelHint: 'Amount',
              textInputType: TextInputType.number,
              fWidth: double.infinity,
              lPad: 12.0,
              rPad: 12.0,
              fKey: 'dialogAmount',
              index: 0,
              dCart: dCart,
            ),
            dContinueButton(
              context: context,
              dButtonValue: 'Save',
              isKey: 'save',
              rPad: 20.0,
              lPad: 20.0,
              bPad: 12.0,
              dCart: dCart,
            ),
          ],
        ),
      ),
    ),
  );
}
