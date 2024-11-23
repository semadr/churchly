import 'package:churchly/src/churchly/presentation/bloc/church_login/church_login_bloc.dart';
import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:churchly/src/core/constants/dfonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget dRegisterChurch({
  required final BuildContext context,
  required final DColors dColors,
  required final DFonts dFonts,
}) {
  return GestureDetector(
    onTap: () {
      ChurchLoginEvent event = const CreateChurchAccount();
      BlocProvider.of<ChurchLoginBloc>(context).add(event);
    },
    child: Text(
      'Or Register your Church',
      style: TextStyle(
        color: dColors.dBlackColor,
        fontSize: dFonts.dFontBody1Size,
        fontWeight: dFonts.dFontBodyWeight,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: dColors.dBlackColor,
      ),
    ),
  );
}
