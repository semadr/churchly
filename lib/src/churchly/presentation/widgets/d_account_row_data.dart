import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:flutter/material.dart';

class DAccountRowData extends StatelessWidget {
  const DAccountRowData({
    super.key,
    required this.dColors,
    required this.dItem,
    required this.dAmount,
    required this.dFonts,
  });

  final DColors dColors;
  final String? dItem;
  final String? dAmount;
  final DFonts dFonts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          color: dColors.dTransColor,
          border: Border.all(
            width: 1.0,
            color: dColors.dTransColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                '$dItem: $dAmount',
                style: TextStyle(
                  fontSize: dFonts.dFontBody1Size,
                  color: dColors.dBlackColor,
                  fontWeight: dFonts.dFontBodyWeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
