import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trabalhofaculdade_flutter/model/edit_user.dart';
import '../util/message.dart';
import '../supabase/config.dart';
import 'package:supabase/supabase.dart';

Future<void> updateProfile(BuildContext context, EditUser user) async {
  try {
    final userEmail = user.emailAntigo.text;
    final oldPassword = user.senhaAntiga.text;

  
    final response = await supabase.from('usuario')
      .select('id, nome, email, senha')
      .eq('email', userEmail)
      .eq('senha', oldPassword)
      .maybeSingle();

    if (response == null || response.isEmpty) {
      throw const AuthException('Senha antiga incorreta');
    }

    final currentUser = response;

    final updatedNome = user.nome.text.isNotEmpty ? user.nome.text : currentUser['nome'];
    final updatedEmail = user.emailNovo.text.isNotEmpty ? user.emailNovo.text : currentUser['email'];
    final updatedSenha = user.senhaNova.text.isNotEmpty ? user.senhaNova.text : currentUser['senha'];

    if (updatedEmail != currentUser['email']) {
      final emailCheckResponse = await supabase.from('usuario')
        .select('id')
        .eq('email', updatedEmail)
        .maybeSingle();

      if (emailCheckResponse != null && emailCheckResponse.isNotEmpty) {
        throw const AuthException('Email já está em uso por outro usuário');
      }
    }

   
    await supabase.from('usuario')
      .update({
        'nome': updatedNome,
        'email': updatedEmail,
        'senha': updatedSenha,
      })
      .eq('id', currentUser['id']); 

    if (context.mounted) {
      messageSuccess(context, "Perfil atualizado com sucesso!");
    }
  } on AuthException catch (error) {
    if (context.mounted) {
      messageError(context, error.message);
    }
  } on Exception catch (error) {
    if (context.mounted) {
      messageError(context, error.toString());
    }
  }
}