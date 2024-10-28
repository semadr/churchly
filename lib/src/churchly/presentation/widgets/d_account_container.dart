import 'package:churchly/src/churchly/presentation/widgets/d_account_row.dart';
import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DAccountContainer extends StatelessWidget {
  const DAccountContainer({
    super.key,
    required this.dColors,
    required this.dFonts,
    required this.accountBoxName,
    required this.accounttBoxRealTimeDate,
    required this.fData,
  });

  final List<Map<String, String>> fData;
  final DColors dColors;
  final DFonts dFonts;
  final String accountBoxName;
  final String accounttBoxRealTimeDate;

  @override
  Widget build(BuildContext context) {
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
                      accountBoxName,
                      style: TextStyle(
                        fontSize: dFonts.dFontBody2Size,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: dColors.dSecondaryColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
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
                  if (kDebugMode) print(fData.length.toString());
                  if (index == (fData.length - 1)) {
                    return DAccountRow(
                      itemLabel: fData[index]['item']!,
                      item: fData[index]['item']!,
                      price: fData[index]['amount']!,
                      category: accountBoxName,
                      dIcon: Icons.add,
                      index: index,
                    );
                  } else {
                    return DAccountRow(
                      itemLabel: fData[index]['item']!,
                      item: fData[index]['item']!,
                      price: fData[index]['amount']!,
                      category: accountBoxName,
                      dIcon: Icons.remove,
                      index: index,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
