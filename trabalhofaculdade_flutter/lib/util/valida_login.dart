import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> validaLogin(BuildContext context, String email, String senha) async {
  
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString('UserEmail', email);

  if (email == "garcom@gmail.com" && senha == "123456") {
    Navigator.of(context).pushNamed("pedidosGarcomScreen");
    return;
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Login Inválido'),
        content: const Text('As credenciais de login fornecidas estão incorretas.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}