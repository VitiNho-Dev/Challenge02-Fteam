import 'package:flutter/services.dart';

class PhoneMask extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var telefone = newValue.text;
    if (telefone.length > 19) {
      return oldValue;
    }
    telefone = telefone.replaceAll(RegExp(r'\D'), '');

    var formatted = '';
    for (var i = 0; i < telefone.codeUnits.length; i++) {
      if ([0, 2, 2, 4, 4, 9].contains(i)) {
        if (i == 0) {
          formatted += '+';
        }
        if (i == 2) {
          formatted += ' ';
        }
        if (i == 2) {
          formatted += '(';
        }
        if (i == 4) {
          formatted += ')';
        }
        if (i == 4) {
          formatted += ' ';
        }
        if (i == 9) {
          formatted += '-';
        }
      }
      formatted += telefone[i];
    }

    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.fromPosition(
        TextPosition(offset: formatted.length),
      ),
    );
  }
}
