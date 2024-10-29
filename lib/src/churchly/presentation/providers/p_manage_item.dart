import 'package:flutter/foundation.dart';

class ChurchFinanceItemProvider extends ChangeNotifier {
  ChurchFinanceItemProvider();

  // Map<String, String> financeData;

  String _item = 'item';
  String _amount = 'amount';

  final List<Map<String, String>> _incomeFinanceView = [
    {'item': 'Offering', 'amount': 'amount'},
    {'item': 'item', 'amount': 'amount'},
    {'item': 'item', 'amount': 'amount'},
    {'item': 'item', 'amount': 'amount'},
  ];
  final List<Map<String, String>> _expenseFinanceView = [
    {'item': 'Tithe', 'amount': 'amount'},
    {'item': 'item', 'amount': 'amount'},
    {'item': 'item', 'amount': 'amount'},
    {'item': 'item', 'amount': 'amount'},
  ];

  List<Map<String, String>>? get expenseFinanceView => _expenseFinanceView;
  List<Map<String, String>>? get incomeFinanceView => _incomeFinanceView;
  String get item => _item;
  String get amount => _amount;

  void addItem(String dItem) {
    _item = dItem;
    notifyListeners();
  }

  void addAmount(String dAmount) {
    _amount = dAmount;
    notifyListeners();
  }

  void clearItemAmount() {
    _item = '';
    _amount = '';
    notifyListeners();
  }

  void addFinanceItem(String dItem, String dAmount, String dCart) {
    if (dCart == 'Income') {
      _incomeFinanceView.add({'item': dItem, 'amount': dAmount});
    } else {
      _expenseFinanceView.add({'item': dItem, 'amount': dAmount});
    }
    notifyListeners();
  }

  void removeFinanceItem(int index, String dCart) {
    if (dCart == 'Income') {
      _incomeFinanceView.removeAt(index);
    } else {
      _expenseFinanceView.removeAt(index);
    }
    notifyListeners();
  }

  void updateItem(int index, String dItem, String dCart) {
    if (dCart == 'Income') {
      final updatedList = _incomeFinanceView[index];
      if (index >= 0 && index < updatedList.length) {
        updatedList['item'] = dItem;
        _incomeFinanceView.insert(index, updatedList);
        if (kDebugMode) {
          print('Item Updated Successfully!');
        }
      }
    } else {
      final updatedList = _expenseFinanceView[index];
      if (index >= 0 && index < updatedList.length) {
        updatedList['item'] = dItem;
        _incomeFinanceView.insert(index, updatedList);
        if (kDebugMode) {
          print('Item Updated Successfully!');
        }
      }
    }
    notifyListeners();
  }

  void updateAmount(int index, String dAmount, String dCart) {
    if (dCart == 'Income') {
      final updatedList = _incomeFinanceView[index];
      if (index >= 0 && index < updatedList.length) {
        updatedList['amount'] = dAmount;
        _incomeFinanceView.insert(index, updatedList);
        if (kDebugMode) {
          print('Amount Updated Successfully!');
        }
      }
    } else {
      final updatedList = _expenseFinanceView[index];
      if (index >= 0 && index < updatedList.length) {
        updatedList['amount'] = dAmount;
        _incomeFinanceView.insert(index, updatedList);
        if (kDebugMode) {
          print('Amount Updated Successfully!');
        }
      }
    }
    notifyListeners();
  }
}
