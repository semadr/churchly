import 'package:churchly/src/churchly/presentation/bloc/d_manage_item.dart';
import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:churchly/src/core/usecases/d_finance_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          if (dIcon == Icons.add) {
            ShowFinanceDialog().showFinanceDialog(context, 'Insert New Item', dCart);
          } else {
            context.read<ChurchFinanceItem>().removeFinanceItem(index);
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
