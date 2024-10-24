import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:flutter/material.dart';

class DFinanceFormField extends StatelessWidget {
  final String labelHint;
  final TextInputType textInputType;
  final double fWidth;
  final double lPad;
  final double rPad;
  final String fKey;

  const DFinanceFormField({
    super.key,
    required this.labelHint,
    required this.textInputType,
    required this.fWidth,
    required this.lPad,
    required this.rPad,
    required this.fKey,
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
            // ChurchFinanceEvent event = ChurchFinanceEvent()
          },
          controller: textEditingController,
          // onChanged: () {},
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
