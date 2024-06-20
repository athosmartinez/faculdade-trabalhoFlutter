import 'dart:async';

import 'package:trabalhofaculdade_flutter/model/user_register.dart';

import '../util/message.dart';
import 'components/button.dart';
import 'package:flutter/material.dart';
import '../supabase/login.dart';
import 'package:trabalhofaculdade_flutter/screens/components/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  UserRegister user = UserRegister();

  Future<void> _signIn(BuildContext context) async {
    try {
      setState(() => _isLoading = true);
      await signIn(context, user);
    } on Exception catch (error) {
      if (context.mounted) {
        messageError(context, error.toString());
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return _isLoading
      ? const Center(child: CircularProgressIndicator())
      : Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                    hintText: 'E-mail',
                    prefixIcon: Icons.email,
                    controller: user.email,
                  ),
                  CustomTextFormField(
                    hintText: 'Senha',
                    prefixIcon: Icons.lock,
                    controller: user.senha,
                    obscureText: true,
                    isPasswordField: true,
                  ),
                  Button(title: 'Login', isFull: true, onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _isLoading ? null : _signIn(context);
                    } else {
                      messageError(context, 'Informe os dados de login');
                    }
                  })
                ],
              ),
            ),
          ),
        ),
      );
  }
}