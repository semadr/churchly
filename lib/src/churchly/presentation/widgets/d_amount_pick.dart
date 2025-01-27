import 'package:churchly/src/churchly/data/models/account_month.dart';
import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DMonthPick extends StatelessWidget {
  final DColors dColors;
  final DFonts dFonts;

  const DMonthPick({
    super.key,
    required this.dColors,
    required this.dFonts,
  });

  @override
  Widget build(BuildContext context) {
    final dHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 16.0),
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
                'Account Month: ',
                style: TextStyle(
                  color: dColors.dBlackColor,
                  fontSize: dFonts.dFontBody1Size,
                ),
              ),
            ),
            DropdownMenu(
              onSelected: (value) {
                if (kDebugMode) {
                  print(value);
                }
              },
              menuHeight: dHeight - (dHeight / 2),
              width: 180.0,
              hintText: 'August',
              enabled: true,
              inputDecorationTheme: InputDecorationTheme(
                fillColor: dColors.dSecondaryColor.withOpacity(.25),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: dColors.dTransColor,
                    width: 0.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: dColors.dTransColor,
                    width: 0.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                ),
              ),
              menuStyle: MenuStyle(
                elevation: const MaterialStatePropertyAll(1.0),
                side: MaterialStatePropertyAll(
                  BorderSide(
                    color: dColors.dSecondaryColor.withOpacity(.25),
                    width: 1.0,
                  ),
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    side: BorderSide(
                      color: dColors.dSecondaryColor,
                      width: 1.0,
                    ),
                  ),
                ),
                backgroundColor:
                    MaterialStatePropertyAll(dColors.dSecondaryColor),
              ),
              dropdownMenuEntries: AccountMonth.accountMonthChildren(),
            ),
          ],
        ),
      ),
    );
  }
}
