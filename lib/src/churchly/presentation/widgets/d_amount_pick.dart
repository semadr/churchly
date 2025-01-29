import 'package:churchly/src/churchly/data/models/account_month.dart';
import 'package:churchly/src/churchly/presentation/bloc/church_info/church_info_bloc.dart';
import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:churchly/src/core/usecases/d_field_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class DMonthPick extends StatelessWidget {
  final DColors dColors;
  final DFonts dFonts;
  final String labelKey;

  const DMonthPick({
    super.key,
    required this.dColors,
    required this.dFonts,
    required this.labelKey,
  });

  @override
  Widget build(BuildContext context) {
    final dHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 16.0),
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
              onSelected: (pickMonth) {
                Provider.of<AccountMonthProvider>(context, listen: false)
                    .setActiveMonth(pickMonth);
                DFieldEvent dFieldEvent = DFieldEvent();
                ChurchInfoEvent event =
                    dFieldEvent.findFieldEvent(pickMonth, labelKey);
                BlocProvider.of<ChurchInfoBloc>(context).add(event);
              },
              menuHeight: dHeight - (dHeight / 2),
              width: 180.0,
              hintText: context.watch<AccountMonthProvider>().activeMonth,
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
                  borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: dColors.dTransColor,
                    width: 0.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                ),
              ),
              menuStyle: MenuStyle(
                elevation: const MaterialStatePropertyAll(1.0),
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
              dropdownMenuEntries: AccountMonthProvider.accountMonthChildren(),
            ),
          ],
        ),
      ),
    );
  }
}
