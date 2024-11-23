import 'package:churchly/src/churchly/presentation/widgets/d_continue_button.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_header.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_text_field.dart';
import 'package:flutter/material.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        children: [
          dHeaderWidget(
            dHeaderText: 'Welcome to ',
            dChurchlyLogo: 'assets/images/churchly-logo-black.png',
          ),
          dTextFormField(
            context: context,
            labelKey: 'branchName',
            labelName: 'Branch Name: ',
            labelHint: 'E.g. No. A.G. Ikot Effiom Eyamba',
            textInputType: TextInputType.text,
          ),
          dTextFormField(
            context: context,
            labelKey: 'address',
            labelName: 'Address: ',
            labelHint: 'E.g. No. 8, Itak Ikot Street',
            textInputType: TextInputType.text,
          ),
          dTextFormField(
            context: context,
            labelKey: 'pastorName',
            labelName: 'Pastor\'s Name: ',
            labelHint: 'E.g. Rev. Chilaka Nna',
            textInputType: TextInputType.text,
          ),
          dTextFormField(
            context: context,
            labelKey: 'pastorNumber',
            labelName: 'Pastor\'s Phone No: ',
            labelHint: 'E.g. 08101849506',
            textInputType: TextInputType.phone,
          ),
          dTextFormField(
            context: context,
            labelKey: 'treasurerName',
            labelName: 'Treasurer\'s Name: ',
            labelHint: 'E.g. Deac. Atu Michael',
            textInputType: TextInputType.text,
          ),
          dTextFormField(
            context: context,
            labelKey: 'treasurerNumber',
            labelName: 'Treasurer\'s Phone No: ',
            labelHint: 'E.g. 08101849506',
            textInputType: TextInputType.number,
          ),
          Row(
            children: [
              Expanded(
                child: dTextFormField(
                  context: context,
                  labelKey: 'accountMonth',
                  labelName: 'Month: ',
                  labelHint: 'E.g. 12',
                  textInputType: TextInputType.number,
                ),
              ),
              Expanded(
                child: dTextFormField(
                  context: context,
                  labelKey: 'accountYear',
                  labelName: 'Year: ',
                  labelHint: 'E.g. 2003',
                  textInputType: TextInputType.number,
                ),
              ),
            ],
          ),
          dContinueButton(
            context: context,
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
