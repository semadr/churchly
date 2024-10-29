import 'package:flutter/foundation.dart';

class ChurchFinanceItemProvider extends ChangeNotifier {
  ChurchFinanceItemProvider();

  // Map<String, String> financeData;

  final List<Map<String, String>> _incomeFinanceView = [
    {'item': 'item', 'amount': 'amount'},
    {'item': 'item', 'amount': 'amount'},
    {'item': 'item', 'amount': 'amount'},
    {'item': 'item', 'amount': 'amount'},
  ];
  final List<Map<String, String>> _expenseFinanceView = [
    {'item': 'item', 'amount': 'amount'},
    {'item': 'item', 'amount': 'amount'},
    {'item': 'item', 'amount': 'amount'},
    {'item': 'item', 'amount': 'amount'},
  ];

  List<Map<String, String>>? get expenseFinanceView => _expenseFinanceView;

  void addFinanceItem(String dItem, String dAmount, String dCart) {
    if (dCart == 'Income') {
      _incomeFinanceView.add({});
    }
    _expenseFinanceView.add({});
  }

  void removeFinanceItem(int index, String dCart) {
    if (dCart == 'Income') {
      _incomeFinanceView.removeAt(index);
    }
    _expenseFinanceView.removeAt(index);
  }

  void updateItem(int index, String dItem, String dCart) {
    if (dCart == 'Income') {
      final updatedList = _incomeFinanceView[index];
      if (index >= 0 && index < updatedList.length) {
        updatedList['item'] = dItem;
        _incomeFinanceView.insert(index, updatedList);
      }
    }
    final updatedList = _expenseFinanceView[index];
    if (index >= 0 && index < updatedList.length) {
      updatedList['item'] = dItem;
      _incomeFinanceView.insert(index, updatedList);
    }
  }

  void updateAmount(int index, String dAmount, String dCart) {
    if (dCart == 'Income') {
      final updatedList = _incomeFinanceView[index];
      if (index >= 0 && index < updatedList.length) {
        updatedList['amount'] = dAmount;
        _incomeFinanceView.insert(index, updatedList);
      }
    }
    final updatedList = _expenseFinanceView[index];
    if (index >= 0 && index < updatedList.length) {
      updatedList['amount'] = dAmount;
      _incomeFinanceView.insert(index, updatedList);
    }
  }
}
