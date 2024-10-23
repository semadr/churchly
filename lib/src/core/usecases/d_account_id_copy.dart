import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccountID {
  void copyToClipboard(BuildContext context, String accountId) {
    Clipboard.setData(
      ClipboardData(text: accountId),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Acocunt ID copied to clipboard!"),
        duration: Duration(milliseconds: 2000),
      ),
    );
  }
}
