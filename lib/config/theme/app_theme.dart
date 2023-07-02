import 'package:flutter/material.dart';

const Color _customColor = Color(0xff49149ff);

const List<Color> _colorTheme = [
  _customColor,
  Colors.red,
  Colors.green,
  Colors.yellowAccent,
  Colors.blue,
  Colors.orange,
  Colors.pink
];

class AppTheme {
  final int selectColor;

  AppTheme({this.selectColor = 0})
      : assert(selectColor >= 0 && selectColor <= _colorTheme.length - 1,
            'selectColor must by grated 0 and less ${_colorTheme.length}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorTheme[selectColor]);
  }
}
