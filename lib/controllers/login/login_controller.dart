import 'package:firebase_auth/firebase_auth.dart';
import 'package:todolist/services/firebase_auth/firebase_auth_service.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final FirebaseAuthService _auth = FirebaseAuthService();

  @observable
  String? emailErro;

  @observable
  String? passwordErro;


  bool validateEmailRegExp(String email) {
    RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    return regex.hasMatch(email);
  }

  @action
  void validateEmail(String email) {
    final isEmailValid = validateEmailRegExp(email);

    if (email.isEmpty) {
      emailErro = "O campo usuário é obrigatório.";
    } else if (!isEmailValid) {
      emailErro = "Por favor, insira um e-mail válido.";
    } else {
      emailErro = null;
    }
  }

  @action
  void validatePassword(String password) {
    if (password.isEmpty) {
      passwordErro = "O campo senha é obrigatório.";
    } else if (password.length < 2) {
      passwordErro = "O campo senha não pode ter menos que dois caracteres.";
    } else {
      passwordErro = null;
    }
  }

  @action
  onEmailChanged(String email) {
    if (email.isEmpty) {
      emailErro = "O campo usuário é obrigatório.";
    } else {
      emailErro = null;
    }
  }

  @action
  onPasswordChanged(String password) {
    if (password.isEmpty) {
      passwordErro = "O campo usuário é obrigatório.";
    } else if (password.length < 2) {
      passwordErro = "O campo senha não pode ter menos que dois caracteres.";
    } else {
      passwordErro = null;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      User? user = await _auth.signInWithEmailAndPassword(email, password);

      return user != null;
    } catch (e) {
      return false;
    }
  }
}
