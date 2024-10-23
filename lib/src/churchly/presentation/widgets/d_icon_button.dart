import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:churchly/src/core/usecases/d_finance_dialog.dart';
import 'package:flutter/material.dart';

class DAddIconButton extends StatelessWidget {
  final IconData? dIcon;
  final String isKey;

  const DAddIconButton({
    super.key,
    required this.dIcon,
    required this.isKey,
  });

  @override
  Widget build(BuildContext context) {
    DColors dColors = DColors();
    DFonts dFonts = DFonts();

    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: IconButton(
        onPressed: () => ShowFinanceDialog().showFinanceDialog(
          context,
          'Insert New Item',
        ),
        icon: Icon(
          dIcon,
          color: dColors.dBlackColor,
          size: dFonts.dFontBody2Size,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            dColors.dSecondaryColor,
          ),
        ),
        color: dColors.dSecondaryColor,
      ),
    );
  }
}
