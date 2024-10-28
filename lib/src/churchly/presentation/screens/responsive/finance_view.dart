import 'package:churchly/src/churchly/presentation/bloc/d_manage_item.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_account_container.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_account_id.dart';
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
        body: BlocBuilder<ChurchFinanceItem, List<Map<String, String>>>(
          builder: (context, churchFinanceItem) {
            return ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                DAccountID(
                  dColors: dColors,
                  accountId: accountId!,
                  dFonts: dFonts,
                ),
                DAccountContainer(
                  fData: churchFinanceItem,
                  dColors: dColors,
                  dFonts: dFonts,
                  accountBoxName: 'Income',
                  accounttBoxRealTimeDate: 'August 18th',
                ),
                DAccountContainer(
                  fData: churchFinanceItem,
                  dColors: dColors,
                  dFonts: dFonts,
                  accountBoxName: 'Expenses',
                  accounttBoxRealTimeDate: 'August 18th',
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
