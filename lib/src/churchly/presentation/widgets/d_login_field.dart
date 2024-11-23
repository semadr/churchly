import 'package:churchly/src/churchly/presentation/bloc/church_login/church_login_bloc.dart';
import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget dLoginFormField({
  required final BuildContext context,
  required final String labelName,
  required final String labelHint,
  required final TextInputType textInputType,
}) {
  final TextEditingController textEditingController = TextEditingController();
  final DColors dColors = DColors();
  final DFonts dFonts = DFonts();

  //
  return SizedBox(
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8.0, right: 26.0, left: 26.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 34.0, vertical: 8.0),
            child: Text(
              labelName,
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: dFonts.dFontFamily,
                fontWeight: dFonts.dFontBodyWeight,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            child: TextField(
              onChanged: (dInput) {
                ChurchLoginEvent event =
                    OnAccountIDFieldChange(accountID: dInput);
                BlocProvider.of<ChurchLoginBloc>(context).add(event);
              },
              controller: textEditingController,
              keyboardType: textInputType,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                labelText: labelHint,
                labelStyle: TextStyle(
                  fontFamily: dFonts.dFontFamily,
                  fontWeight: dFonts.dFontBodyWeight,
                  color: dColors.dBlackColor.withOpacity(.5),
                  fontSize: 14.0,
                ),
                filled: true,
                fillColor: dColors.dSecondaryColor.withOpacity(.35),
                focusColor: dColors.dSecondaryColor.withOpacity(.05),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: dColors.dTransColor,
                    width: 0.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: dColors.dTransColor,
                    width: 0.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: dColors.dPrimaryColor,
                    width: 1.5,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                ),
                suffixIcon: IconButton(
                  onPressed: () => textEditingController.clear(),
                  icon: const Icon(Icons.clear),
                  color: dColors.dBlackColor,
                  iconSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
