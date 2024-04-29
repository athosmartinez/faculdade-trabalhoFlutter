import 'package:flutter/material.dart';
import 'package:trabalhofaculdade_flutter/screens/components/appBar.dart';
import 'package:trabalhofaculdade_flutter/screens/components/textField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  bool _rememberMe = false;

  // Criação dos TextEditingControllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // É importante limpar os controllers quando o widget for desalocado
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
          // Aqui você pode usar _emailController.text e _passwordController.text
          // para obter os valores inseridos nos campos de texto
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
    return Scaffold(
      appBar: const WavyAppBar(),
      body: Form(
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
      // A barra de navegação inferior permanece a mesma
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                if (ModalRoute.of(context)?.settings.name != 'loginScreen') {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    'loginScreen',
                    (Route<dynamic> route) => false,
                  );
                }
              },
              child: const Text('Login', style: TextStyle(fontSize: 18)),
            ),
            TextButton(
              onPressed: () {
                if (ModalRoute.of(context)?.settings.name != 'registerScreen') {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    'registerScreen',
                    (Route<dynamic> route) => false,
                  );
                }
              },
              child: const Text('Registrar', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
