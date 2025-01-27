import 'package:churchly/src/churchly/presentation/widgets/d_account_row.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DFinanceViewBuilder {
  Widget financeViewBuilder(int index, String dCart,
      List<Map<String, String>> fData, BuildContext context) {
    if (kDebugMode) {
      print('My list length: ${fData.length}');
    }
    if (index == (fData.length - 1)) {
      return DAccountRow(
        itemLabel: fData[index]['item']!,
        item: fData[index]['item']!,
        price: fData[index]['amount']!,
        category: dCart,
        dIcon: Icons.add,
        index: index,
      );
    } else {
      return DAccountRow(
        itemLabel: fData[index]['item']!,
        item: fData[index]['item']!,
        price: fData[index]['amount']!,
        category: dCart,
        dIcon: Icons.remove,
        index: index,
      );
    }
  }
}
