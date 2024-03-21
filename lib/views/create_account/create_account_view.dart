import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todolist/controllers/create_accont/create_account_controller.dart';
import 'package:todolist/utils/colors.dart';
import 'package:todolist/utils/strings/create_account_strings.dart';
import 'package:todolist/views/login/login_view.dart';
import 'package:todolist/widgets/buttons/buttom_medium_wideget.dart';
import 'package:todolist/widgets/flushbar_widget/flushbar_erro_widget.dart';
import 'package:todolist/widgets/footer/footer_widget.dart';
import 'package:todolist/widgets/header/header_create_account/header_create_account_widget.dart';
import 'package:todolist/widgets/text_field/text_field_create_account_widget.dart';

class CreateAccontView extends StatefulWidget {
  const CreateAccontView({super.key});

  @override
  State<CreateAccontView> createState() => _CreateAccontViewState();
}

class _CreateAccontViewState extends State<CreateAccontView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  final CreateAccountController _createAccountController =
      CreateAccountController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.tomatoColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderCreateAccountWidget(
              headerTextOne: CreateAccountStrings.crie,
              headerTextTwo: CreateAccountStrings.suaConta,
              textColor: AppColors.whiteColor,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                top: 50.0,
                left: 40.0,
                right: 40.0,
                bottom: 26.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Observer(
                    builder: (_) => TextFieldCreateAccountWidget(
                      controller: _emailController,
                      labelText: CreateAccountStrings.usuario,
                      onChanged: (value) {
                        _createAccountController.onEmailChanged(value);
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Observer(
                    builder: (_) => TextFieldCreateAccountWidget(
                      controller: _passwordController,
                      obscureText: true,
                      labelText: CreateAccountStrings.senha,
                      onChanged: (value) {
                        _createAccountController.onPasswordChanged(
                            password: _passwordController.text);
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Observer(
                    builder: (_) => TextFieldCreateAccountWidget(
                      controller: _repeatPasswordController,
                      obscureText: true,
                      labelText: CreateAccountStrings.confirmarSenha,
                      onChanged: (value) {
                        _createAccountController.onPasswordRepeatChanged(
                          password: _passwordController.text,
                          repeatPassword: value,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 25.0),
                ],
              ),
            ),
            Center(
              child: ButtomMediumWidget(
                textButtom: CreateAccountStrings.criarConta,
                textColorButtom: AppColors.tomatoColor,
                backgroundColor: AppColors.whiteColor,
                onPressed: () {
                  _createAccountController.validateEmail(
                    _emailController.text,
                  );
                  _createAccountController.validatePassword(
                    password: _passwordController.text,
                    repeatPassword: _repeatPasswordController.text,
                  );
                  _handleRegister(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                },
              ),
            ),
            const Spacer(),
            FooterWidget(
              textFooterOne: CreateAccountStrings.jaTemConta,
              textFooterTwo: CreateAccountStrings.irParaLogin,
              textColor: AppColors.whiteColor,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void _handleRegister(
      {required String email, required String password}) async {
    bool result =
        await _createAccountController.signUp(email: email, password: password);

    if (context.mounted) {
      if (result) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const LoginView(),
          ),
          (route) => false,
        );
      } else {
        FlushbarErroWidget(
          title: CreateAccountStrings.erroAoCadastrarUsuario,
          message: CreateAccountStrings.porFavorTenteNovamente,
          context: context,
        );
      }
    }
  }
}
