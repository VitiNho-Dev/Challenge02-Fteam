import 'package:flutter/services.dart';

class RGMask extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var rg = newValue.text;
    if (rg.length > 12) {
      return oldValue;
    }
    rg = rg.replaceAll(RegExp(r'[\D]'), '');

    var formatted = '';
    for (var i = 0; i < rg.codeUnits.length; i++) {
      if ([2, 5, 8].contains(i)) {
        formatted += i == 8 ? '-' : '.';
      }
      formatted += rg[i];
    }

    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.fromPosition(
        TextPosition(offset: formatted.length),
      ),
    );
  }
}
