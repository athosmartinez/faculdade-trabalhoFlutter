import 'package:flutter/material.dart';
import 'package:trabalhofaculdade_flutter/screens/components/bottom_navigation.dart';
import '../util/valida_login.dart';
import './components/appBar.dart';
import 'components/text_field.dart';
import 'components/button.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WavyAppBar(),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Image.asset("assets/images/logo.png",
                      width: 180, height: 180),
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
                Button(title: 'Login', isFull: true, onPressed: () {
                  validaLogin(context, _emailController.text, _passwordController.text);
                }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(
        param1: ParamBottomNavigation(label: "Login", icon: Icons.login, route: "loginScreen"),
        param2: ParamBottomNavigation(label: "Registrar", icon: Icons.app_registration_rounded, route: "registerScreen")
      ),
    );
  }
}
