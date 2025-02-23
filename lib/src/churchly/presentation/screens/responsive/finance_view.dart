import 'package:churchly/src/churchly/data/models/account_month.dart';
import 'package:churchly/src/churchly/presentation/bloc/d_manage_item.dart';
import 'package:churchly/src/churchly/presentation/providers/p_manage_item.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_account_container.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_account_id.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_amount_pick.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_continue_button.dart';
import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinanceView extends StatelessWidget {
  const FinanceView({super.key, required this.accountId});

  final String? accountId;

  @override
  Widget build(BuildContext context) {
    DColors dColors = DColors();
    DFonts dFonts = DFonts();

    // final dHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => ChurchFinanceItem(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Image.asset(
            'assets/images/churchly-logo-black.png',
            width: 80.0,
            height: 80.0,
          ),
          leading: IconButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/loginView'),
            icon: Icon(
              Icons.arrow_back_ios,
              color: dColors.dSecondaryColor,
            ),
          ),
          actions: [
            CircleAvatar(
              radius: 20.0,
              backgroundColor: dColors.dTransColor,
              backgroundImage:
                  const AssetImage('assets/images/ic_launcher.png'),
            ),
          ],
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const PageScrollPhysics(),
          children: [
            DAccountID(
              dColors: dColors,
              accountId: accountId!,
              dFonts: dFonts,
            ),
            DMonthPick(
              dColors: dColors,
              dFonts: dFonts,
              labelKey: 'accountMonth',
            ),
            DAccountContainer(
              fData:
                  context.watch<ChurchFinanceItemProvider>().incomeFinanceView!,
              dColors: dColors,
              dFonts: dFonts,
              dCart: 'Income',
              accounttBoxRealTimeDate:
                  context.watch<AccountMonthProvider>().activeMonth,
            ),
            DAccountContainer(
              fData: context
                  .watch<ChurchFinanceItemProvider>()
                  .expenseFinanceView!,
              dColors: dColors,
              dFonts: dFonts,
              dCart: 'Expenses',
              accounttBoxRealTimeDate:
                  context.watch<AccountMonthProvider>().activeMonth,
            ),
            const DContinueButton(
              isKey: 'update',
              dButtonValue: 'Save Month',
              rPad: 50.0,
              lPad: 50.0,
              bPad: 16.0,
            ),
            const DContinueButton(
              isKey: 'print',
              dButtonValue: 'Generate Sheet',
              rPad: 50.0,
              lPad: 50.0,
              bPad: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
