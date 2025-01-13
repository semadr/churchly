import 'package:churchly/src/churchly/presentation/providers/p_manage_item.dart';
import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget dFinanceFormField({
  required final BuildContext context,
  required final String labelHint,
  required final TextInputType textInputType,
  required final double fWidth,
  required final double lPad,
  required final double rPad,
  required final String fKey,
  required final int index,
  required final String dCart,
}) {
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
        onSubmitted: (dInput) {
          if (fKey == 'pageItem' || fKey == 'pageAmount') {
            if (fKey == 'pageItem') {
              Provider.of<ChurchFinanceItemProvider>(context, listen: false)
                  .updateItem(index, dInput, dCart);
              if (kDebugMode) {
                print('My index:  $index');
              }
            } else {
              Provider.of<ChurchFinanceItemProvider>(context, listen: false)
                  .updateAmount(index, dInput, dCart);
            }
          } else {
            if (fKey == 'dialogItem') {
              Provider.of<ChurchFinanceItemProvider>(context, listen: false)
                  .addItem(dInput);
            } else {
              Provider.of<ChurchFinanceItemProvider>(context, listen: false)
                  .addAmount(dInput);
            }
          }
        },
        // onChanged: (dInput) async {},
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
