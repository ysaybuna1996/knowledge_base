import 'package:flutter/material.dart';

class CustomIcons {
  CustomIcons._();

  static const _kFontFamSAP = 'Sap';
  static const _kFontFamSP = 'Sharepoint';
  static const _kFontFamKronos = 'Kronos';

  static const IconData sap = IconData(0xe800, fontFamily: _kFontFamSAP);
  static const IconData kronos = IconData(0xe800, fontFamily: _kFontFamKronos);
  static const IconData sharepoint = IconData(0xe801, fontFamily: _kFontFamSP);
}
