import 'package:churchly/src/churchly/presentation/bloc/church_finance/church_finance_bloc.dart';
import 'package:churchly/src/churchly/presentation/bloc/d_manage_item.dart';
import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:churchly/src/core/usecases/d_finance_field_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DFinanceFormField extends StatelessWidget {
  final String labelHint;
  final TextInputType textInputType;
  final double fWidth;
  final double lPad;
  final double rPad;
  final String fKey;
  final int index;

  const DFinanceFormField({
    super.key,
    required this.labelHint,
    required this.textInputType,
    required this.fWidth,
    required this.lPad,
    required this.rPad,
    required this.fKey,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    final DColors dColors = DColors();
    final DFonts dFonts = DFonts();

    //
    return SizedBox(
      width: fWidth,
      height: 80.0,
      child: Padding(
        padding: EdgeInsets.only(left: lPad, right: rPad),
        child: TextField(
          onChanged: (dInput) {
            DFinanceFieldEvent dFinanceFieldEvent = DFinanceFieldEvent();
            ChurchFinanceEvent event =
                dFinanceFieldEvent.findFinanceFieldEvent(dInput, fKey);
            BlocProvider.of<ChurchFinanceBloc>(context).add(event);

            if (fKey == 'pageItem' || fKey == 'pageAmount') {
              if (fKey == 'pageItem') {
              } else {
                context.read<ChurchFinanceItem>().updateAmount(index, dInput);
              }
            }
          },
          controller: textEditingController,
          keyboardType: textInputType,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
            labelText: labelHint,
            labelStyle: TextStyle(
              fontFamily: dFonts.dFontFamily,
              fontWeight: dFonts.dFontBodyWeight,
              color: dColors.dBlackColor.withOpacity(.5),
              fontSize: 14.0,
            ),
            filled: true,
            fillColor: dColors.dSecondaryColor.withOpacity(.35),
            focusColor: dColors.dSecondaryColor.withOpacity(.05),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: dColors.dTransColor,
                width: 0.0,
                style: BorderStyle.solid,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: dColors.dTransColor,
                width: 0.0,
                style: BorderStyle.solid,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: dColors.dPrimaryColor,
                width: 1.5,
                style: BorderStyle.solid,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            ),
          ),
        ),
      ),
    );
  }
}
