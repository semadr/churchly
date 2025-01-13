import 'dart:io';

import 'package:churchly/src/churchly/presentation/providers/pdf/save_and_open_pdf.dart';
import 'package:pdf/widgets.dart';

class AccountFinanceSheet {
  final String item;
  final String amount;

  AccountFinanceSheet({required this.item, required this.amount});
}

class TablePdfApi {
  static Future<File> generateTablePdf() async {
    final pdf = Document();

    final headers = ['Item', 'Amount'];

    final accountSheet = [
      AccountFinanceSheet(item: 'Church Offering', amount: '19'),
      AccountFinanceSheet(item: 'Church Offering', amount: '19'),
      AccountFinanceSheet(item: 'Church Offering', amount: '19'),
    ];

    final data =
        accountSheet.map((aSheet) => [aSheet.item, aSheet.amount]).toList();

    pdf.addPage(
      Page(
        build: (context) => TableHelper.fromTextArray(
          data: data,
          headers: headers,
          cellAlignment: Alignment.center,
          tableWidth: TableWidth.max,
          headerHeight: 100.0,
          cellHeight: 100.0,
          border: TableBorder.all(width: 5),
          headerStyle: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
          cellStyle: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return SaveAndOpenDocument.savePdf(name: 'table_pdf.pdf', pdf: pdf);
  }
}
