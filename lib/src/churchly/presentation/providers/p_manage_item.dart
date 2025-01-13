import 'package:flutter/foundation.dart';
// import 'package:provider/provider.dart';

class ChurchFinanceItemProvider extends ChangeNotifier {
  ChurchFinanceItemProvider();

  String _item = 'item';
  String _amount = 'amount';
  String _accountID = '';
  String _iTotal = '';
  String _eTotal = '';

  final List<Map<String, String>> _incomeFinanceView = [
    {'item': 'Offering', 'amount': '120000'},
    {'item': 'Tithe', 'amount': '70000'},
    {'item': 'Building without Tears', 'amount': '50000'},
  ];
  final List<Map<String, String>> _expenseFinanceView = [
    {'item': 'Fuel', 'amount': '4000'},
    {'item': 'Passonage Rent', 'amount': '20000'},
    {'item': 'Children', 'amount': '8000'},
    {'item': 'Snacks', 'amount': '5000'},
  ];

  List<Map<String, String>>? get expenseFinanceView => _expenseFinanceView;
  List<Map<String, String>>? get incomeFinanceView => _incomeFinanceView;
  String get item => _item;
  String get amount => _amount;
  String get accountID => _accountID;
  String get iTotal => _iTotal;
  String get eTotal => _eTotal;

  void addItem(String dItem) {
    _item = dItem;
    notifyListeners();
  }

  void getAccountID(String dAccountID) {
    _accountID = dAccountID;
    notifyListeners();
  }

  void addAmount(String dAmount) {
    _amount = dAmount;
    notifyListeners();
  }

  void clearItemAmount() {
    _item = 'item';
    _amount = 'amount';
    notifyListeners();
  }

  void addFinanceItem(String dCart) {
    if (dCart == 'Income') {
      _incomeFinanceView.add({'item': _item, 'amount': _amount});
    } else {
      _expenseFinanceView.add({'item': _item, 'amount': _amount});
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
      Map<String, String> updatedList = _incomeFinanceView[index];
      if (index >= 0 && index < _expenseFinanceView.length) {
        updatedList['item'] = dItem;
        _incomeFinanceView[index] = updatedList;
        if (kDebugMode) {
          print('Item Updated Successfully!');
        }
      }
    } else {
      Map<String, String> updatedList = _expenseFinanceView[index];
      if (index >= 0 && index < _expenseFinanceView.length) {
        updatedList['item'] = dItem;
        _expenseFinanceView[index] = updatedList;
        if (kDebugMode) {
          print('Item Updated Successfully!');
        }
      }
    }
    notifyListeners();
  }

  void updateAmount(int index, String dAmount, String dCart) {
    if (dCart == 'Income') {
      Map<String, String> updatedList = _incomeFinanceView[index];
      if (index >= 0 && index < _incomeFinanceView.length) {
        updatedList['amount'] = dAmount;
        _incomeFinanceView[index] = updatedList;
        if (kDebugMode) {
          print('Amount Updated Successfully!');
        }
      }
    } else {
      Map<String, String> updatedList = _expenseFinanceView[index];
      if (index >= 0 && index < _expenseFinanceView.length) {
        updatedList['amount'] = dAmount;
        _expenseFinanceView[index] = updatedList;
        if (kDebugMode) {
          print('Amount Updated Successfully!');
        }
      }
    }
    notifyListeners();
  }

  void sumIAmount() {
    final iView = _incomeFinanceView;
    double iSum = 0;

    for (int i = 0; i < iView.length; i++) {
      iSum = iSum + double.parse(iView[i]['amount']!);
    }
    _iTotal = iSum.toString();
    notifyListeners();
  }

  void sumEAmount() {
    final eView = _expenseFinanceView;
    double eSum = 0;

    for (var i = 0; i < eView.length; i++) {
      eSum = eSum + double.parse(eView[i]['amount']!);
    }
    _eTotal = eSum.toString();
    notifyListeners();
  }
}
