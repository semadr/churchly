import 'package:churchly/src/churchly/presentation/providers/p_manage_item.dart';
import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:churchly/src/core/usecases/d_finance_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DAddIconButton extends StatelessWidget {
  final IconData? dIcon;
  final String isKey;
  final int index;
  final String dCart;

  const DAddIconButton({
    super.key,
    required this.dIcon,
    required this.isKey,
    required this.index,
    required this.dCart,
  });

  @override
  Widget build(BuildContext context) {
    DColors dColors = DColors();
    DFonts dFonts = DFonts();

    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: IconButton(
        onPressed: () {
          try {
            if (dIcon == Icons.add) {
              ShowFinanceDialog()
                  .showFinanceDialog(context, 'Insert New Item', dCart);
            } else if (dIcon == Icons.remove) {
              Provider.of<ChurchFinanceItemProvider>(context, listen: false)
                  .removeFinanceItem(index, dCart);
            }
          } on Exception catch (e) {
            if (kDebugMode) print('Error: $e');
          }
        },
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
