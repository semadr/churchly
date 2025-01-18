class DMonthGenerator {
  Map<int, String> accountMonths = {
    1: 'January',
    2: 'February',
    3: 'March',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'July',
    8: 'August',
    9: 'September',
    10: 'October',
    11: 'November',
    12: 'December',
  };

  int dViewMonthIndex(String accountMonth) {
    return int.parse(accountMonth);
  }

  String dViewMonth(String accountMonth) {
    final accountMonthindex = dViewMonthIndex(accountMonth);
    return accountMonths[accountMonthindex]!.toUpperCase();
  }
}
