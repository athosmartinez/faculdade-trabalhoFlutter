import 'package:flutter/material.dart';
import '../util/valida_login.dart';
import './components/textField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _buildRememberMeCheckbox() {
    return Row(
      children: <Widget>[
        Checkbox(
          value: _rememberMe,
          onChanged: (bool? value) {
            setState(() {
              _rememberMe = value!;
            });
          },
        ),
        const Text('Lembrar senha?'),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          validaLogin(context, _emailController.text, _passwordController.text);
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        child: const Text('Login'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Image.asset("assets/images/img_logo.png",
                      width: 200, height: 200),
                ),
                CustomTextFormField(
                  hintText: "Email",
                  prefixIcon: Icons.email,
                  controller: _emailController,
                ),
                CustomTextFormField(
                  hintText: 'Senha',
                  prefixIcon: Icons.lock,
                  controller: _passwordController,
                  obscureText: true,
                  isPasswordField: true,
                ),
                _buildRememberMeCheckbox(),
                _buildLoginButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
