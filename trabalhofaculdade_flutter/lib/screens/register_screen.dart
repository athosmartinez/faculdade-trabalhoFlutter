import 'package:flutter/material.dart';
import 'package:trabalhofaculdade_flutter/screens/components/appBar.dart';
import 'package:trabalhofaculdade_flutter/screens/components/bottom_navigation.dart';
import 'package:trabalhofaculdade_flutter/screens/components/text_field.dart';

enum Gender { male, female, other }

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Gender? _gender = Gender.other; // Valor padrão

  Widget _buildGenderRadio(String title, Gender value) {
    return RadioListTile<Gender>(
      title: Text(title),
      value: value,
      groupValue: _gender,
      onChanged: (Gender? newValue) {
        setState(() {
          _gender = newValue!;
        });
      },
      dense: true,
    );
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                Image.asset("assets/images/logo.png",
                    width: 180, height: 180),
                CustomTextFormField(
                  hintText: "Nome",
                  prefixIcon: Icons.person,
                  controller: _nameController,
                ),
                CustomTextFormField(
                  hintText: "E-mail",
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
                Row(
                  children: [
                    const Icon(Icons.cases_rounded),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Função", style:  Theme.of(context).textTheme.bodyMedium),
                    ),
                  ],
                ),
                _buildGenderRadio('Garçom', Gender.male),
                _buildGenderRadio('Cozinheiro', Gender.female),
                _buildRegisterButton()
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

Widget _buildRegisterButton() {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
    child: ElevatedButton(
      onPressed: () {
        // Aqui você pode usar _emailController.text e _passwordController.text
        // para obter os valores inseridos nos campos de texto
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
      ),
      child: const Text('Registrar'),
    ),
  );
}
