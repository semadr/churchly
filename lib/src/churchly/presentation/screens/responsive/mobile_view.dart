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
        physics: const PageScrollPhysics(),
        children: const [
          DHeaderWidget(
            dHeaderText: 'Welcome to ',
            dChurchlyLogo: 'assets/images/churchly-logo-black.png',
          ),
          DTextFormField(
            labelKey: 'branchName',
            labelName: 'Branch Name: ',
            labelHint: 'E.g. No. A.G. Ikot Effiom Eyamba',
            textInputType: TextInputType.text,
          ),
          DTextFormField(
            labelKey: 'address',
            labelName: 'Address: ',
            labelHint: 'E.g. No. 8, Itak Ikot Street',
            textInputType: TextInputType.text,
          ),
          DTextFormField(
            labelKey: 'pastorName',
            labelName: 'Pastor\'s Name: ',
            labelHint: 'E.g. Rev. Chilaka Nna',
            textInputType: TextInputType.text,
          ),
          DTextFormField(
            labelKey: 'pastorNumber',
            labelName: 'Pastor\'s Phone No: ',
            labelHint: 'E.g. 08101849506',
            textInputType: TextInputType.phone,
          ),
          DTextFormField(
            labelKey: 'treasurerName',
            labelName: 'Treasurer\'s Name: ',
            labelHint: 'E.g. Deac. Atu Michael',
            textInputType: TextInputType.text,
          ),
          DTextFormField(
            labelKey: 'treasurerNumber',
            labelName: 'Treasurer\'s Phone No: ',
            labelHint: 'E.g. 08101849506',
            textInputType: TextInputType.number,
          ),
          Row(
            children: [
              Expanded(
                child: DTextFormField(
                  labelKey: 'accountMonth',
                  labelName: 'Month: ',
                  labelHint: 'E.g. 12',
                  textInputType: TextInputType.number,
                ),
              ),
              Expanded(
                child: DTextFormField(
                  labelKey: 'accountYear',
                  labelName: 'Year: ',
                  labelHint: 'E.g. 2003',
                  textInputType: TextInputType.number,
                ),
              ),
            ],
          ),
          DContinueButton(
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
