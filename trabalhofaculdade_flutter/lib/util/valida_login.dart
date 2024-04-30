import 'package:flutter/material.dart';

void validaLogin(BuildContext context, String email, String senha) {
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