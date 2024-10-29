import 'package:churchly/src/churchly/presentation/widgets/d_continue_button.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_finance_field.dart';
import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:flutter/material.dart';

class DFinanceDialog extends StatelessWidget {
  final String dCart;

  const DFinanceDialog({
    super.key,
    required this.dCart,
  });

  @override
  Widget build(BuildContext context) {
    DFonts dFonts = DFonts();
    DColors dColors = DColors();

    return Center(
      child: SizedBox(
        height: 400.0,
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
              DFinanceFormField(
                labelHint: 'Item name',
                textInputType: TextInputType.text,
                fWidth: double.infinity,
                lPad: 12.0,
                rPad: 12.0,
                fKey: 'dialogItem',
                index: 0,
                dCart: dCart,
              ),
              DFinanceFormField(
                labelHint: 'Amount',
                textInputType: TextInputType.text,
                fWidth: double.infinity,
                lPad: 12.0,
                rPad: 12.0,
                fKey: 'dialogAmount',
                index: 0,
                dCart: dCart,
              ),
              DContinueButton(
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
}
