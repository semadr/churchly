import 'package:churchly/src/churchly/data/models/finance_data.dart';
// import 'package:churchly/src/churchly/presentation/widgets/d_account_row.dart';
import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:flutter/material.dart';

class AutoView extends StatelessWidget {
  const AutoView({super.key});

  @override
  Widget build(BuildContext context) {
    FinanceData fData = FinanceData();
    DColors dColors = DColors();

    return Scaffold(
      backgroundColor: dColors.dWhiteColor,
      body: ListView.builder(
        itemCount: fData.itemCount,
        itemBuilder: (BuildContext context, int index) {
          // return const DAccountRow();
          return Container();
        },
      ),
    );
  }
}
