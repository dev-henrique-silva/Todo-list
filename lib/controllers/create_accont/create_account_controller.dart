import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:todolist/services/firebase_auth/firebase_auth_service.dart';

part 'create_account_controller.g.dart';

class CreateAccountController = _CreateAccountController
    with _$CreateAccountController;

abstract class _CreateAccountController with Store {
  final FirebaseAuthService _auth = FirebaseAuthService();

  @observable
  String? emailErro;

  @observable
  String? passwordErro;

  @observable
  String? repeatPasswordErro;


  bool validateEmailRegExp(String email) {
    RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    return regex.hasMatch(email);
  }

  @action
  void validateEmail(String email) {
    final isEmailValid = validateEmailRegExp(email);

    if (email.isEmpty) {
      emailErro = "O campo usuário é obrigatório";
    } else if (!isEmailValid) {
      emailErro = "Por favor, insira um e-mail válido";
    } else {
      emailErro = null;
    }
  }

  @action
  void validatePassword(
      {required String password, required String repeatPassword}) {
    if (password.isEmpty) {
      passwordErro = "O campo senha é obrigatório";
    } else if (password.length < 2) {
      passwordErro = "O campo senha não pode ter menos que dois caracteres";
    } else if (repeatPassword != password) {
      passwordErro =
          "As senhas não coincidem, verifique os campos e tente novamente";
    } else {
      passwordErro = null;
    }
  }

  @action
  void validateRepeatPassword(
      {required String password, required String repeatPassword}) {
    if (repeatPassword.isEmpty) {
      repeatPasswordErro = "O campo senha é obrigatório";
    } else if (repeatPassword.length < 2) {
      repeatPasswordErro =
          "O campo senha não pode ter menos que dois caracteres";
    } else if (repeatPassword != password) {
      repeatPasswordErro =
          "As senhas não coincidem, verifique os campos e tente novamente";
    } else {
      repeatPasswordErro = null;
    }
  }

  @action
  onEmailChanged(String email) {
    if (email.isEmpty) {
      emailErro = "O campo usuário é obrigatório";
    } else {
      emailErro = null;
    }
  }

  @action
  onPasswordChanged({required String password}) {
    if (password.isEmpty) {
      passwordErro = "O campo usuário é obrigatório.";
    } else if (password.length < 2) {
      passwordErro = "O campo senha não pode ter menos que dois caracteres.";
    } else {
      passwordErro = null;
    }
  }

  @action
  onPasswordRepeatChanged(
      {required String password, required String repeatPassword}) {
    if (password.isEmpty) {
      passwordErro = "O campo usuário é obrigatório.";
    } else if (password.length < 2) {
      passwordErro = "O campo senha não pode ter menos que dois caracteres.";
    } else if (password != repeatPassword) {
      repeatPasswordErro =
          "As senhas não coincidem, por favor, tente novamente.";
    } else {
      passwordErro = null;
    }
  }

  Future<bool> signUp({
    required String email,
    required String password,
  }) async {
    try {
      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      return user != null;
    } catch (e) {
      return false;
    }
  }
}
