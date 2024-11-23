import 'package:churchly/src/churchly/presentation/widgets/d_continue_button.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_login_field.dart';
import 'package:churchly/src/churchly/presentation/widgets/d_register_church.dart';
import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    DColors dColors = DColors();
    DFonts dFonts = DFonts();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: CircleAvatar(
                radius: 20.0,
                backgroundColor: dColors.dTransColor,
                backgroundImage:
                    const AssetImage('assets/images/ic_launcher.png'),
              ),
            ),
            dLoginFormField(
              context: context,
              labelName: 'Account ID',
              labelHint: 'AGaccount_id',
              textInputType: TextInputType.text,
            ),
            dContinueButton(
              context: context,
              dButtonValue: 'Continue',
              isKey: 'login',
              rPad: 50.0,
              lPad: 50.0,
              bPad: 16.0,
            ),
            dRegisterChurch(
              context: context,
              dColors: dColors,
              dFonts: dFonts,
            ),
          ],
        ),
      ),
    );
  }
}
