import 'package:churchly/src/churchly/presentation/widgets/d_amount_pick.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_continue_button.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_header.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_text_field.dart';
import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:flutter/material.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    DColors dColors = DColors();
    DFonts dFonts = DFonts();

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const PageScrollPhysics(),
        children: [
          const DHeaderWidget(
            dHeaderText: 'Welcome to ',
            dChurchlyLogo: 'assets/images/churchly-logo-black.png',
          ),
          const DTextFormField(
            labelKey: 'branchName',
            labelName: 'Branch Name: ',
            labelHint: 'E.g. No. A.G. Ikot Effiom Eyamba',
            textInputType: TextInputType.text,
          ),
          const DTextFormField(
            labelKey: 'address',
            labelName: 'Address: ',
            labelHint: 'E.g. No. 8, Itak Ikot Street',
            textInputType: TextInputType.text,
          ),
          const DTextFormField(
            labelKey: 'pastorName',
            labelName: 'Pastor\'s Name: ',
            labelHint: 'E.g. Rev. Chilaka Nna',
            textInputType: TextInputType.text,
          ),
          const DTextFormField(
            labelKey: 'pastorNumber',
            labelName: 'Pastor\'s Phone No: ',
            labelHint: 'E.g. 08101849506',
            textInputType: TextInputType.phone,
          ),
          const DTextFormField(
            labelKey: 'treasurerName',
            labelName: 'Treasurer\'s Name: ',
            labelHint: 'E.g. Deac. Atu Michael',
            textInputType: TextInputType.text,
          ),
          const DTextFormField(
            labelKey: 'treasurerNumber',
            labelName: 'Treasurer\'s Phone No: ',
            labelHint: 'E.g. 08101849506',
            textInputType: TextInputType.number,
          ),
          Row(
            children: [
              Expanded(
                child: DMonthPick(
                  dColors: dColors,
                  dFonts: dFonts,
                  labelKey: 'accountMonth',
                ),
              ),
              const Expanded(
                child: DTextFormField(
                  labelKey: 'accountYear',
                  labelName: 'Year: ',
                  labelHint: 'E.g. 2003',
                  textInputType: TextInputType.number,
                ),
              ),
            ],
          ),
          const DContinueButton(
            dButtonValue: 'Continue',
            isKey: 'create',
            rPad: 50.0,
            lPad: 50.0,
            bPad: 16.0,
          ),
        ],
      ),
    );
  }
}
