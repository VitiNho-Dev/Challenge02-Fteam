import 'package:flutter/cupertino.dart';

class ControllerTextFormField extends ValueNotifier<bool> {
  ControllerTextFormField(bool value) : super(value);

  String password = '';
  String confirmPassword = '';

  String? validateName(String? text) {
    if (text == null || text.isEmpty) {
      return 'O campo nome não pode ser vazio!';
    } else if (!RegExp(r'[\sa-zA-Z]+[\sa-zA-Z]$').hasMatch(text)) {
      return 'Digite um name válido!';
    }
    return null;
  }

  String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return 'O campo email não pode ser vazio!';
    } else if (!RegExp(r'^.+@[a-zA-Z]+.{1}[a-zA-Z]+(.{0,1}[a-zA-Z]+)$')
        .hasMatch(text)) {
      return 'Digite um E-mail válido!';
    }
    return null;
  }

  String? validatePassword(password) {
    if (password == null || password.isEmpty) {
      return 'O campo password não pode ser vazio!';
    }
    if (!RegExp(r'[\d]{8}$').hasMatch(password)) {
      return 'Digite um password válido!';
    }
    return null;
  }

  String? validateConfirmPassword(confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'O campo confirm password não pode ser vazio!';
    }
    if (!isTextCorret() == true) {
      return 'Esta senha não corresponde a senha anterior!';
    }
    if (!RegExp(r'[\d]{8}$').hasMatch(confirmPassword)) {
      return 'Digite um password válido!';
    }
    return null;
  }

  bool isTextCorret() {
    if (password == confirmPassword) {
      return true;
    }
    return false;
  }

  void isValue() {
    value = !value;
  }
}
