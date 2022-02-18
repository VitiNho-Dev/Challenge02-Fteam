import 'package:flutter/cupertino.dart';

class ControllerProfile extends ValueNotifier<String> {
  ControllerProfile(String value) : super(value);

  String? validateCPF(String? text) {
    if (text == null || text.isEmpty) {
      return 'O campo CPF não pode ser vazio!';
    } else if (!RegExp(r'[\d]+\.+[\d]+\.[\d]+\-[\d]{2}').hasMatch(text)) {
      return 'Digite um CPF válido!';
    }
    return null;
  }

  String? validateRG(String? text) {
    if (text == null || text.isEmpty) {
      return 'O campo RG não pode ser vazio!';
    } else if (!RegExp(r'[\d]{2}\.+[\d]+\.[\d]+\-[\d]{1}').hasMatch(text)) {
      return 'Digite um RG válido!';
    }
    return null;
  }

  String? validateTelefone(String? text) {
    if (text == null || text.isEmpty) {
      return 'O campo telefone não pode ser vazio!';
    } else if (!RegExp(r'[+\d]{3}\s[(\d)]{4}\s[-\d]{5}\-[\d]{4}')
        .hasMatch(text)) {
      return 'Digite um telefone válido!';
    }
    return null;
  }

  void dropdownValue(String newValue) {
    value = newValue;
  }
}
