import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:churchly/src/core/usecases/d_account_id_copy.dart';
import 'package:flutter/material.dart';

class DAccountID extends StatelessWidget {
  final DColors dColors;
  final String? accountId;
  final DFonts dFonts;

  const DAccountID({
    super.key,
    required this.dColors,
    this.accountId,
    required this.dFonts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          color: dColors.dSecondaryColor.withOpacity(.25),
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
                'Account ID: $accountId',
                style: TextStyle(
                  fontSize: dFonts.dFontBodySize,
                  color: dColors.dBlackColor,
                  fontWeight: dFonts.dFontBodyWeight,
                ),
              ),
            ),
            IconButton(
              color: dColors.dBlackColor,
              onPressed: () => AccountID().copyToClipboard(context, accountId!),
              icon: Icon(
                Icons.copy,
                size: dFonts.dFontBody1Size,
                color: dColors.dBlackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
