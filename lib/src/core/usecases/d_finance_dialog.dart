import 'package:churchly/src/churchly/presentation/widgets/d_finance_dialog_popup.dart';
import 'package:flutter/material.dart';

class ShowFinanceDialog {
  void showFinanceDialog(
      BuildContext context, String financeTitle, String dCart) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DFinanceDialog(
          dCart: dCart,
        );
      },
    );
  }
}
