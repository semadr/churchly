import 'package:flutter/foundation.dart';

class ChurchInfoProvider extends ChangeNotifier {
  String _branchName = '';
  String _address = '';
  String _pastorName = '';
  String _pastorNumber = '';
  String _treasurerName = '';
  String _treasurerNumber = '';
  String _accountMonth = '';
  String _accountYear = '';

  String get branchName => _branchName;
  String get address => _address;
  String get pastorName => _pastorName;
  String get pastorNumber => _pastorNumber;
  String get treasurerName => _treasurerName;
  String get treasurerNumber => _treasurerNumber;
  String get accountMonth => _accountMonth;
  String get accountYear => _accountYear;

  void updateBranchName(String nBranchName) {
    _branchName = nBranchName;
    notifyListeners();
  }

  void updateAddress(String nAddress) {
    _address = nAddress;
    notifyListeners();
  }

  void updatePastorName(String nPastorName) {
    _pastorName = nPastorName;
    notifyListeners();
  }

  void updatePastorNumber(String nPastorNumber) {
    _pastorNumber = nPastorNumber;
    notifyListeners();
  }

  void updateTreasurerName(String nTreasurerName) {
    _treasurerName = nTreasurerName;
    notifyListeners();
  }

  void updateTreasurerNumber(String nTreasurerNumber) {
    _treasurerNumber = nTreasurerNumber;
    notifyListeners();
  }

  void updateAccountMonth(String nAccountMonth) {
    _accountMonth = nAccountMonth;
    notifyListeners();
  }

  void updateAccountYear(String nAccountYear) {
    _accountYear = nAccountYear;
    notifyListeners();
  }

  void updateAll({
    String? nBranchName,
    String? nAddress,
    String? nPastorName,
    String? nPastorNumber,
    String? nTreasurerName,
    String? nTreasurerNumber,
    String? nAccountMonth,
    String? nAccountYear,
  }) {
    updateBranchName(nBranchName!);
    updateAddress(nAddress!);
    updatePastorName(nPastorName!);
    updatePastorNumber(nPastorNumber!);
    updateTreasurerName(nTreasurerName!);
    updateTreasurerNumber(nTreasurerNumber!);
    updateAccountMonth(nAccountMonth!);
    updateAccountYear(nAccountYear!);
  }
}
