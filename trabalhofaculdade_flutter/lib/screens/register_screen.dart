import 'package:flutter/material.dart';
import 'package:trabalhofaculdade_flutter/model/funcao.dart';
import 'package:trabalhofaculdade_flutter/model/user_register.dart';
import 'package:trabalhofaculdade_flutter/screens/components/button.dart';
import 'package:trabalhofaculdade_flutter/screens/components/text_field.dart';
import 'package:trabalhofaculdade_flutter/supabase/register.dart';
import 'package:trabalhofaculdade_flutter/util/message.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isLoading = false;
  UserRegister userRegistration = UserRegister();

  Future<void> _register(BuildContext context) async {
    try {
      setState(() => _isLoading = true);
      await register(context, userRegistration);
      userRegistration = UserRegister();
    } on Exception catch (error) {
      if (context.mounted) {
        messageError(context, error.toString());
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Widget _buildFuncaoRadio(String title, Funcao value) {
    return RadioListTile<Funcao>(
      title: Text(title),
      dense: true,
      value: value,
      groupValue: userRegistration.funcao,
      onChanged: (Funcao? newValue) {
        setState(() => userRegistration.funcao = newValue);
      },
    );
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/images/logo.png", width: 180, height: 180),
                CustomTextFormField(
                  hintText: 'Nome',
                  prefixIcon: Icons.person,
                  controller: userRegistration.nome,
                ),
                CustomTextFormField(
                  hintText: 'E-mail',
                  prefixIcon: Icons.email,
                  controller: userRegistration.email,
                ),
                CustomTextFormField(
                  hintText: 'Senha',
                  prefixIcon: Icons.lock,
                  controller: userRegistration.senha,
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
                FormField<Funcao>(
                  builder: (FormFieldState<Funcao> state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFuncaoRadio('Garçom', Funcao.garcom),
                        _buildFuncaoRadio('Cozinheiro', Funcao.cozinheiro),
                        if (state.hasError)
                          Text(
                            state.errorText!,
                            style: const TextStyle(color: Colors.red, fontSize: 12),
                          ),
                      ],
                    );
                  },
                  validator: (value) => userRegistration.funcao == null ? 'Informe a Função!' : null,
                ),
                Button(title: 'Registrar', isFull: true, onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _isLoading ? null : _register(context);
                  } else {
                    messageError(context, 'Informe os dados para registrar!');
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}