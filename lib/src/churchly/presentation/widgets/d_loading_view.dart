import 'package:churchly/src/core/constants/dcolors.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    DColors dColors = DColors();

    return Scaffold(
      backgroundColor: dColors.dWhiteColor,
      
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          color: dColors.dSecondaryColor,
        ),
      ),
    );
  }
}
