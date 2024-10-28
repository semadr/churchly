import 'package:flutter/material.dart';

class FinanceData extends ChangeNotifier {
  String? _item;
  String? _price;
  int _itemCount = 4; // The Count of the List Items.

  String get item => _item!;
  String get price => _price!;
  int get itemCount => _itemCount;

  Map<String, String>? _dFinanceData;
  List<Map<String, String>>? dFinanceView = [
    {
      'item': 'item',
      'price': 'price',
    },
    {
      'item': 'item',
      'price': 'price',
    },
    {
      'item': 'item',
      'price': 'price',
    },
    {
      'item': 'item',
      'price': 'price',
    },
  ];

  Map<String, String> get dFinanceData => _dFinanceData!;
  // List<Map<String, String>> get dFinanceView => _dFinanceView!;

  void updateFinanceData(item, price) {
    _dFinanceData = {
      'item': item,
      'price': price,
    };
    notifyListeners();
  }

  void updateFinanceView(int index, Map<String, String> dFData) {
    dFinanceView![index] = dFData;
    updateFinanceViewCount();
    notifyListeners();
  }

  void updateFinanceViewCount() {
    _itemCount++;
  }

  // const FinanceData({this.item, this.price});
}

Map callValue = {
  'item': FinanceData().item,
  'price': FinanceData().price,
};
