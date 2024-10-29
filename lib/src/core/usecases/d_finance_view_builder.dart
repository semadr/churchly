import 'package:churchly/src/churchly/presentation/providers/p_manage_item.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_account_row.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DFinanceViewBuilder {
  DAccountRow financeViewBuilder(
      int index, String dCart, ChurchFinanceItemProvider fData) {
    if (dCart == 'Income') {
      List<Map<String, String>> fIData = fData.incomeFinanceView!;

      if (kDebugMode) {
        print('My list length: ${fIData.length.toString()}');
      }
      if (index == (fIData.length - 1)) {
        return DAccountRow(
          itemLabel: fIData[index]['item']!,
          item: fIData[index]['item']!,
          price: fIData[index]['amount']!,
          category: dCart,
          dIcon: Icons.add,
          index: index,
        );
      } else {
        return DAccountRow(
          itemLabel: fIData[index]['item']!,
          item: fIData[index]['item']!,
          price: fIData[index]['amount']!,
          category: dCart,
          dIcon: Icons.remove,
          index: index,
        );
      }
    } else {
      List<Map<String, String>> fEData = fData.expenseFinanceView!;
      if (kDebugMode) {
        print('My list length: ${fEData.length.toString()}');
      }
      if (index == (fEData.length - 1)) {
        return DAccountRow(
          itemLabel: fEData[index]['item']!,
          item: fEData[index]['item']!,
          price: fEData[index]['amount']!,
          category: dCart,
          dIcon: Icons.add,
          index: index,
        );
      } else {
        return DAccountRow(
          itemLabel: fEData[index]['item']!,
          item: fEData[index]['item']!,
          price: fEData[index]['amount']!,
          category: dCart,
          dIcon: Icons.remove,
          index: index,
        );
      }
    }
  }
}
