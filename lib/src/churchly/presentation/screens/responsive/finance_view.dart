import 'package:churchly/src/churchly/data/models/account_month.dart';
import 'package:churchly/src/churchly/presentation/bloc/d_manage_item.dart';
import 'package:churchly/src/churchly/presentation/providers/p_manage_item.dart';
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
    // Provider(create: create);
    DColors dColors = DColors();
    DFonts dFonts = DFonts();
    // final dWidth = MediaQuery.of(context).size.width;
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
          physics: const ClampingScrollPhysics(),
          children: [
            DAccountID(
              dColors: dColors,
              accountId: accountId!,
              dFonts: dFonts,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  color: dColors.dTransColor,
                  border: Border.all(
                    width: 1.0,
                    color: dColors.dTransColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Account Month: ',
                        style: TextStyle(
                          color: dColors.dBlackColor,
                          fontSize: dFonts.dFontBody1Size,
                        ),
                      ),
                    ),
                    DropdownMenu(
                      width: 180.0,
                      hintText: 'August',
                      enabled: true,
                      inputDecorationTheme: InputDecorationTheme(
                        fillColor: dColors.dSecondaryColor.withOpacity(.25),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: dColors.dTransColor,
                            width: 0.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(0.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: dColors.dTransColor,
                            width: 0.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(0.0)),
                        ),
                      ),
                      menuStyle: MenuStyle(
                        elevation: const MaterialStatePropertyAll(0.0),
                        side: MaterialStatePropertyAll(
                          BorderSide(
                            color: dColors.dSecondaryColor.withOpacity(.25),
                            width: 1.0,
                          ),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            side: BorderSide(
                              color: dColors.dSecondaryColor,
                              width: 1.0,
                            ),
                          ),
                        ),
                        backgroundColor:
                            MaterialStatePropertyAll(dColors.dSecondaryColor),
                      ),
                      dropdownMenuEntries: AccountMonth.accountMonthChildren(),
                    ),
                  ],
                ),
              ),
            ),
            DAccountContainer(
              fData:
                  context.watch<ChurchFinanceItemProvider>().incomeFinanceView!,
              dColors: dColors,
              dFonts: dFonts,
              dCart: 'Income',
              accounttBoxRealTimeDate: 'August 18th',
            ),
            DAccountContainer(
              fData: context
                  .watch<ChurchFinanceItemProvider>()
                  .expenseFinanceView!,
              dColors: dColors,
              dFonts: dFonts,
              dCart: 'Expenses',
              accounttBoxRealTimeDate: 'August 18th',
            ),
          ],
        ),
      ),
    );
  }
}
