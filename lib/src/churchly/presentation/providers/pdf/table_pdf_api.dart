import 'dart:io';

import 'package:churchly/src/churchly/presentation/providers/p_manage_item.dart';
import 'package:churchly/src/churchly/presentation/providers/pdf/save_and_open_pdf.dart';
import 'package:churchly/src/core/usecases/d_month_generator.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:provider/provider.dart';

class AccountFinanceSheet {
  final String item;
  final String amount;

  AccountFinanceSheet({required this.item, required this.amount});
}

class TablePdfApi {
  static Future<File> generateTablePdf(dynamic context) async {
    final pdf = Document();

    final headers = ['ITEM', 'AMOUNT'];
    final financialData =
        Provider.of<ChurchFinanceItemProvider>(context, listen: false);

    final incomeSheet = financialData.incomeFinanceView;
    final expenseSheet = financialData.expenseFinanceView;

    final fData = [
      incomeSheet?.map((iSheet) => [iSheet['item'], iSheet['amount']]).toList(),
      expenseSheet
          ?.map((eSheet) => [eSheet['item'], eSheet['amount']])
          .toList(),
    ];
    // final data = incomeSheet
    //     ?.map((iSheet) => [iSheet['item'], iSheet['amount']])
    //     .toList();

    pdf.addPage(
      MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          generateFinanceHeader('CHURCHLY ACCOUNT REPORT SHEET'),
          generateFinanceDetails(
            pastorName: 'REV. UMOETOR F. JUMBO',
            treasurerName: 'DEAC. ANDEM',
            branchName: 'IKOT EFFIOM EYAMBA',
            address: 'NO. 313 MURTALA MOHAMMED HIGHWAY',
            accountMonth: '1',
            accountYear: '2025',
          ),
          generateFinanceSubHeader('MONTH ACCOUNT TOTAL'),
          generateFinanceTable(fData, headers, 0),
          generateFinanceSubHeader('EXPENSE'),
          generateFinanceTable(fData, headers, 1),
        ],
      ),
    );

    return SaveAndOpenDocument.savePdf(
        name: 'churchly_account_sheet_pdf.pdf', pdf: pdf);
  }

  static Table generateFinanceTable(
      List<List<List<String?>>?> fData, List<String> headers, int index) {
    return TableHelper.fromTextArray(
      data: fData[index]!,
      headers: headers,
      cellAlignment: Alignment.center,
      tableWidth: TableWidth.max,
      headerHeight: 50.0,
      cellHeight: 50.0,
      border: TableBorder.all(width: 1.25),
      headerStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
      cellStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static Widget generateFinanceHeader(String churchName) => Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 4.0,
        ),
        alignment: Alignment.center,
        child: Text(
          churchName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22.0,
            color: PdfColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  static Widget generateFinanceSubHeader(String fDataType) => Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        alignment: Alignment.center,
        child: Text(
          textAlign: TextAlign.center,
          fDataType,
          style: TextStyle(
            fontSize: 16.0,
            color: PdfColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  static Widget generateFinanceDetails({
    String? pastorName,
    String? treasurerName,
    String? branchName,
    String? address,
    String? accountMonth,
    String? accountYear,
  }) =>
      Container(
        padding: const EdgeInsets.symmetric(
          vertical: 4.0,
          horizontal: 4.0,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Paragraph(
              text: 'L/C PASTOR\'S NAME: $pastorName ',
              style: TextStyle(
                fontSize: 16.0,
                color: PdfColors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            Paragraph(
              text: 'TREASURER\'S NAME: $treasurerName ',
              style: TextStyle(
                fontSize: 16.0,
                color: PdfColors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            Paragraph(
              text: 'LOCAL CHURCH: $branchName',
              style: TextStyle(
                fontSize: 16.0,
                color: PdfColors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            Paragraph(
              text: 'CHURCH ADDRESS: $address',
              style: TextStyle(
                fontSize: 16.0,
                color: PdfColors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            Paragraph(
              textAlign: TextAlign.center,
              text: 'ACCOUNT MONTH/YEAR: ${DMonthGenerator().dViewMonth(accountMonth!)}, $accountYear',
              style: TextStyle(
                fontSize: 16.0,
                color: PdfColors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      );
}
