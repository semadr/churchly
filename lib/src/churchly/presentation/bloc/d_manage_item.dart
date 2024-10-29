import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChurchFinanceItem extends Cubit<List<Map<String, String>>> {
  ChurchFinanceItem()
      : super([
          {'item': 'item', 'amount': 'amount'},
          {'item': 'item', 'amount': 'amount'},
          {'item': 'item', 'amount': 'amount'},
          {'item': 'item', 'amount': 'amount'},
        ]);

  Map<String, String>? financeData;
  List<Map<String, String>>? financeView = [
    {'item': 'item', 'amount': 'amount'},
    {'item': 'item', 'amount': 'amount'},
    {'item': 'item', 'amount': 'amount'},
    {'item': 'item', 'amount': 'amount'},
  ];

  void addFinanceItem(String dItem, String dAmount) {
    try {
      financeData = {'item': dItem, 'amount': dAmount};
      financeView!.add(financeData!);
      emit(financeView!);
      if (kDebugMode) print('Finance Item Added Successfully');
    } catch (e) {
      if (kDebugMode) print('Error Adding Finance Item');
    }
  }

  void removeFinanceItem(index) {
    try {
      financeView!.removeAt(index);
      emit(financeView!);
      if (kDebugMode) print('Finance Item Deleted Successfully');
    } catch (e) {
      if (kDebugMode) print('Error Deleting Finance Item');
    }
  }

  void updateItem(int index, String dItem) {
    final updatedList = [...state];
    if (index >= 0 && index < updatedList.length) {
      updatedList[index] = {
        ...updatedList[index],
        'item': dItem,
      };
      emit(updatedList);
      if (kDebugMode) print('Item Updated Successfully');
    }
  }

  void updateAmount(int index, String dAmount) {
    final updatedList = [...state];
    if (index >= 0 && index < updatedList.length) {
      updatedList[index] = {
        ...updatedList[index],
        'amount': dAmount,
      };
      emit(updatedList);
      if (kDebugMode) print('Amount Updated Successfully');
    }
  }
}
