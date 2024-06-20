import 'dart:async';

import 'package:trabalhofaculdade_flutter/model/funcao.dart';
import 'package:trabalhofaculdade_flutter/model/user_register.dart';

import '../util/message.dart';
import '../supabase/config.dart';
import 'package:flutter/material.dart';

Future<void> register(BuildContext context, UserRegister user) async {
  try {
    await supabase.from('usuario')
      .insert({
        'nome': user.nome.text,
        'email': user.email.text,
        'senha': user.senha.text,
        'funcao': user.funcao!.name,
      });

    if (context.mounted) {
      messageSuccess(context, "Usuário registrado com sucesso! Volte para tela de login e realize o login.");
    }
  } on Exception catch (error) {
    if (context.mounted) {
      messageError(context, error.toString());
    }
  }
}
