import 'package:churchly/src/churchly/presentation/bloc/church_info/church_info_bloc.dart';
import 'package:churchly/src/churchly/presentation/bloc/church_login/church_login_bloc.dart';
import 'package:churchly/src/churchly/presentation/providers/p_manage_item.dart';
import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class DContinueButton extends StatelessWidget {
  final String isKey;
  final String dButtonValue;
  final double? rPad;
  final double? lPad;
  final double? bPad;
  final String? dCart;

  const DContinueButton({
    super.key,
    required this.isKey,
    required this.dButtonValue,
    required this.rPad,
    required this.lPad,
    required this.bPad,
    this.dCart,
  });

  @override
  Widget build(BuildContext context) {
    DColors dColors = DColors();
    DFonts dFonts = DFonts();

    return Padding(
      padding: EdgeInsets.only(right: rPad!, left: lPad!, bottom: bPad!),
      child: ElevatedButton(
        onPressed: () {
          if (isKey == 'save') {
            ChurchFinanceItemProvider fProvider = ChurchFinanceItemProvider();
            Provider.of<ChurchFinanceItemProvider>(context)
                .addFinanceItem(fProvider.item, fProvider.amount, dCart!);

            Navigator.of(context).pop();
            Provider.of<ChurchFinanceItemProvider>(context).clearItemAmount();
          } else {
            if (isKey == 'create') {
              BlocProvider.of<ChurchInfoBloc>(context)
                  .add(SubmittedChangeEvent());
            } else {
              BlocProvider.of<ChurchLoginBloc>(context)
                  .add(OnSubmittedChangeEvent());
            }
          }

          // Navigator.of(context).pushNamed('/financeView');
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
}
