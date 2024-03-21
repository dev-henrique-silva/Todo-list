// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateAccountController on _CreateAccountController, Store {
  late final _$emailErroAtom =
      Atom(name: '_CreateAccountController.emailErro', context: context);

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
      Atom(name: '_CreateAccountController.passwordErro', context: context);

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

  late final _$repeatPasswordErroAtom = Atom(
      name: '_CreateAccountController.repeatPasswordErro', context: context);

  @override
  String? get repeatPasswordErro {
    _$repeatPasswordErroAtom.reportRead();
    return super.repeatPasswordErro;
  }

  @override
  set repeatPasswordErro(String? value) {
    _$repeatPasswordErroAtom.reportWrite(value, super.repeatPasswordErro, () {
      super.repeatPasswordErro = value;
    });
  }

  late final _$_CreateAccountControllerActionController =
      ActionController(name: '_CreateAccountController', context: context);

  @override
  void validateEmail(String email) {
    final _$actionInfo = _$_CreateAccountControllerActionController.startAction(
        name: '_CreateAccountController.validateEmail');
    try {
      return super.validateEmail(email);
    } finally {
      _$_CreateAccountControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(
      {required String password, required String repeatPassword}) {
    final _$actionInfo = _$_CreateAccountControllerActionController.startAction(
        name: '_CreateAccountController.validatePassword');
    try {
      return super
          .validatePassword(password: password, repeatPassword: repeatPassword);
    } finally {
      _$_CreateAccountControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateRepeatPassword(
      {required String password, required String repeatPassword}) {
    final _$actionInfo = _$_CreateAccountControllerActionController.startAction(
        name: '_CreateAccountController.validateRepeatPassword');
    try {
      return super.validateRepeatPassword(
          password: password, repeatPassword: repeatPassword);
    } finally {
      _$_CreateAccountControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onEmailChanged(String email) {
    final _$actionInfo = _$_CreateAccountControllerActionController.startAction(
        name: '_CreateAccountController.onEmailChanged');
    try {
      return super.onEmailChanged(email);
    } finally {
      _$_CreateAccountControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onPasswordChanged({required String password}) {
    final _$actionInfo = _$_CreateAccountControllerActionController.startAction(
        name: '_CreateAccountController.onPasswordChanged');
    try {
      return super.onPasswordChanged(password: password);
    } finally {
      _$_CreateAccountControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onPasswordRepeatChanged(
      {required String password, required String repeatPassword}) {
    final _$actionInfo = _$_CreateAccountControllerActionController.startAction(
        name: '_CreateAccountController.onPasswordRepeatChanged');
    try {
      return super.onPasswordRepeatChanged(
          password: password, repeatPassword: repeatPassword);
    } finally {
      _$_CreateAccountControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
emailErro: ${emailErro},
passwordErro: ${passwordErro},
repeatPasswordErro: ${repeatPasswordErro}
    ''';
  }
}
