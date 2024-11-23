import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:churchly/src/core/usecases/d_finance_view_builder.dart';
import 'package:flutter/material.dart';

Widget dAccountContainer({
  required final List<Map<String, String>> fData,
  required final DColors dColors,
  required final DFonts dFonts,
  required final String dCart,
  required final String accounttBoxRealTimeDate,
  required final BuildContext fcontext,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 30.0),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
        border: Border.all(
          color: dColors.dSecondaryColor,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    dCart,
                    style: TextStyle(
                      fontSize: dFonts.dFontBody2Size,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: dColors.dSecondaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      accounttBoxRealTimeDate,
                      style: TextStyle(
                        fontSize: dFonts.dFontBody2Size,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: fData.length,
              itemBuilder: (context, int index) {
                return DFinanceViewBuilder()
                    .financeViewBuilder(index, dCart, fData, context);
              },
            ),
          ),
        ],
      ),
    ),
  );
}
