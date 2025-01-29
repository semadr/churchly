import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:flutter/material.dart';

class AccountMonthProvider extends ChangeNotifier {
  final List<String> _months = [
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

  String _activeMonth = 'January';

  
  String get activeMonth => _activeMonth;

  static List<DropdownMenuEntry<String?>> accountMonthChildren() {
    // Month Length.
    int mLength = AccountMonthProvider()._months.length;
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
        label: AccountMonthProvider()._months[i],
        value: AccountMonthProvider()._months[i],
      ));
    }
    return fLength;
  }

  void setActiveMonth(String? pickMonth) {
    _activeMonth = pickMonth!;
    notifyListeners();
  }
}
