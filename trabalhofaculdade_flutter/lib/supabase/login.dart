import 'dart:async';

import 'package:trabalhofaculdade_flutter/model/user_register.dart';
import 'package:trabalhofaculdade_flutter/model/funcao.dart';
import '../util/globals.dart';
import '../model/user_login.dart';
import '../util/message.dart';
import '../supabase/config.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> signIn(BuildContext context, UserRegister dados) async {
  try {
    final list = await supabase.from('usuario')
      .select('id, nome, email, funcao')
      .eq('email', dados.email.text)
      .eq('senha', dados.senha.text);

    if (list.isEmpty) {
      throw const AuthException('');
    }

    user = UserLogin.fromList(list[0]);
    
    if(context.mounted){
      if (user != null && user!.funcao == Funcao.garcom) {
      Navigator.of(context).pushNamed("pedidosGarcomScreen");
    }else{
      Navigator.of(context).pushNamed("cozinheiroScreen");
    }
     }
    
  } on AuthException {
    if (context.mounted) {
      messageError(context, 'Usuário ou senha inválidos!');
    }
  } on Exception catch (error) {
    if (context.mounted) {
      messageError(context, error.toString());
    }
  }
}
