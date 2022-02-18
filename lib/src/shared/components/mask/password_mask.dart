import 'package:flutter/services.dart';

class PasswordMask extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var password = newValue.text;
    if (password.length > 8) {
      return oldValue;
    }

    return newValue;
  }
}
