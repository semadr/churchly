import 'package:churchly/src/churchly/presentation/bloc/church_finance/church_finance_bloc.dart';
import 'package:churchly/src/churchly/presentation/bloc/church_info/church_info_bloc.dart';
import 'package:churchly/src/churchly/presentation/bloc/church_login/church_login_bloc.dart';
import 'package:churchly/src/churchly/presentation/providers/p_manage_item.dart';
import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

Widget dContinueButton({
  required final BuildContext context,
  required final String isKey,
  required final String dButtonValue,
  required final double? rPad,
  required final double? lPad,
  required final double? bPad,
  final String? dCart,
}) {
  DColors dColors = DColors();
  DFonts dFonts = DFonts();

  return Padding(
    padding: EdgeInsets.only(right: rPad!, left: lPad!, bottom: bPad!),
    child: ElevatedButton(
      onPressed: () {
        if (isKey == 'save') {
          Provider.of<ChurchFinanceItemProvider>(context, listen: false)
              .addFinanceItem(dCart!);

          Navigator.of(context).pop();
          Provider.of<ChurchFinanceItemProvider>(context, listen: false)
              .clearItemAmount();
        } else {
          if (isKey == 'create') {
            BlocProvider.of<ChurchInfoBloc>(context)
                .add(SubmittedChangeEvent(context: context));
          }
          if (isKey == 'login') {
            BlocProvider.of<ChurchLoginBloc>(context)
                .add(OnSubmittedChangeEvent(context: context));
          }
          if (isKey == 'update') {
            BlocProvider.of<ChurchFinanceBloc>(context)
                .add(OnChurchFinanceSubmitted(context: context));
          }
        }
      },
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0.0),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return dColors.dSecondaryColor.withOpacity(0.5);
            }
            return dColors.dSecondaryColor;
            // .withOpacity(0.5); // Use the component's default.
          },
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dButtonValue,
            style: TextStyle(
              color: dColors.dBlackColor,
              fontFamily: dFonts.dFontFamily,
              fontWeight: dFonts.dFontBodyWeight,
              fontSize: dFonts.dFontBodySize,
            ),
          ),
        ],
      ),
    ),
  );
}
