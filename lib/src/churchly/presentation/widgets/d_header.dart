import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:flutter/material.dart';

Widget dHeaderWidget({
  required final String dHeaderText,
  required final String dChurchlyLogo,
}) {
  final DColors dColors = DColors();
  final DFonts dFonts = DFonts();

  //
  return SizedBox(
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                dHeaderText,
                style: TextStyle(
                  color: dColors.dBlackColor,
                  fontSize: 35.0,
                  fontFamily: dFonts.dFontFamily,
                  fontWeight: dFonts.dFontBodyWeight,
                ),
              ),
              Image.asset(
                dChurchlyLogo,
                width: 110.0,
                height: 110.0,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
