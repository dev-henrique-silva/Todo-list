// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginController, Store {
  late final _$emailErroAtom =
      Atom(name: '_LoginController.emailErro', context: context);

  @override
  String? get emailErro {
    _$emailErroAtom.reportRead();
    return super.emailErro;
  }

  @override
  set emailErro(String? value) {
    _$emailErroAtom.reportWrite(value, super.emailErro, () {
      super.emailErro = value;
    });
  }

  late final _$passwordErroAtom =
      Atom(name: '_LoginController.passwordErro', context: context);

  @override
  String? get passwordErro {
    _$passwordErroAtom.reportRead();
    return super.passwordErro;
  }

  @override
  set passwordErro(String? value) {
    _$passwordErroAtom.reportWrite(value, super.passwordErro, () {
      super.passwordErro = value;
    });
  }

  late final _$_LoginControllerActionController =
      ActionController(name: '_LoginController', context: context);

  @override
  void validateEmail(String email) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.validateEmail');
    try {
      return super.validateEmail(email);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String password) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.validatePassword');
    try {
      return super.validatePassword(password);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onEmailChanged(String email) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.onEmailChanged');
    try {
      return super.onEmailChanged(email);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onPasswordChanged(String password) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.onPasswordChanged');
    try {
      return super.onPasswordChanged(password);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailErro: ${emailErro},
passwordErro: ${passwordErro}
    ''';
  }
}
