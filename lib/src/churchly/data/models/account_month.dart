import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:flutter/material.dart';

class AccountMonth {
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  static List<DropdownMenuEntry<String?>> accountMonthChildren() {
    // Month Length.
    int mLength = AccountMonth().months.length;
    // Length of the Producing Widgets.
    List<DropdownMenuEntry<String?>> fLength = [];
    for (int i = 0; i < mLength; i++) {
      fLength.add(DropdownMenuEntry<String?>(
        enabled: true,
        trailingIcon: Icon(
          Icons.pie_chart,
          size: DFonts().dFontBody1Size,
          color: DColors().dBlackColor,
        ),
        label: AccountMonth().months[i],
        value: AccountMonth().months[i],
      ));
    }
    return fLength;
  }
}
