import 'package:churchly/src/churchly/presentation/widgets/d_finance_dialog.dart';
import 'package:flutter/material.dart';

class ShowFinanceDialog {
  void showFinanceDialog(
      BuildContext context, String financeTitle, String dCart) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dFinanceDialog(
          context: context,
          dCart: dCart,
        );
      },
    );
  }
}
