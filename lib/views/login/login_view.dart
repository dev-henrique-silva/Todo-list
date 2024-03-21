import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todolist/controllers/login/login_controller.dart';
import 'package:todolist/utils/colors.dart';
import 'package:todolist/utils/strings/login_strings.dart';
import 'package:todolist/views/create_account/create_account_view.dart';
import 'package:todolist/views/home/home_view.dart';
import 'package:todolist/widgets/buttons/buttom_medium_wideget.dart';
import 'package:todolist/widgets/flushbar_widget/flushbar_erro_widget.dart';
import 'package:todolist/widgets/footer/footer_widget.dart';
import 'package:todolist/widgets/header/header_login/header_login_widget.dart';
import 'package:todolist/widgets/text_field/text_field_login_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final LoginController _loginController = LoginController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderLoginWidget(
              headerTextOne: LoginStrings.seja,
              headerTextTwo: LoginStrings.bemVindo,
              textColor: AppColors.whiteColor,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 40.0,
                right: 40.0,
                bottom: 26.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Observer(
                    builder: (_) => TextFieldLoginWidget(
                      controller: _emailController,
                      labelText: LoginStrings.usuario,
                      errorText: _loginController.emailErro,
                      onChanged: (value) {
                        _loginController.onEmailChanged(value);
                      },
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Observer(
                    builder: (_) => TextFieldLoginWidget(
                      controller: _passwordController,
                      labelText: LoginStrings.senha,
                      obscureText: true,
                      errorText: _loginController.passwordErro,
                      onChanged: (value) {
                        _loginController.onPasswordChanged(value);
                      },
                    ),
                  ),
                  const SizedBox(height: 25.0),
                ],
              ),
            ),
            Center(
              child: ButtomMediumWidget(
                textButtom: LoginStrings.entrar,
                textColorButtom: AppColors.whiteColor,
                backgroundColor: AppColors.tomatoColor,
                onPressed: () {
                  _loginController.validateEmail(_emailController.text);
                  _loginController.validatePassword(_passwordController.text);
                  _handleLogin(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                },
              ),
            ),
            const Spacer(),
            FooterWidget(
              textFooterOne: LoginStrings.naoTemConta,
              textFooterTwo: LoginStrings.crieSuaConta,
              textColor: AppColors.whiteColor,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CreateAccontView(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void _handleLogin({required String email, required String password}) async {
    bool result =
        await _loginController.login(email: email, password: password);

    if (context.mounted) {
      if (result) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const HomeView(),
          ),
          (route) => false,
        );
      } else {
        FlushbarErroWidget(
          title: LoginStrings.erroAoFazerLogin,
          message: LoginStrings.emailOuSenhaIncorreto,
          context: context,
        );
      }
    }
  }
}
