import 'package:flutter/rendering.dart';

class DFonts {
  final String _dFontFamily = 'DMSans';
  final FontWeight _dFontBodyWeight = FontWeight.w400;
  final FontWeight _dFontBody2Weight = FontWeight.w600;
  final FontWeight _dFontBoldWeight = FontWeight.bold;
  
  final double _dFontMiniSize = 12.0;
  final double _dFontBodySize = 14.0;
  final double _dFontBody1Size = 16.0;
  final double _dFontBody2Size = 18.0;
  final double _dFontPHeaderSize = 30.0;
  final double _dFontSHeaderSize = 20.0;

  String get dFontFamily => _dFontFamily;
  FontWeight get dFontBodyWeight => _dFontBodyWeight;
  FontWeight get dFontBody2Weight => _dFontBody2Weight;
  FontWeight get dFontBoldWeight => _dFontBoldWeight;


  double get dFontMiniSize => _dFontMiniSize;
  double get dFontBodySize => _dFontBodySize;
  double get dFontBody1Size => _dFontBody1Size;
  double get dFontBody2Size => _dFontBody2Size;
  double get dFontPHeaderSize => _dFontPHeaderSize;
  double get dFontSHeaderSize => _dFontSHeaderSize;
}
