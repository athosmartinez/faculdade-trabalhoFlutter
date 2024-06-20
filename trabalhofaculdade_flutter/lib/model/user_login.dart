import 'package:trabalhofaculdade_flutter/model/funcao.dart';

class UserLogin {
  int? id;
  String nome;
  String email;
  Funcao? funcao;

  UserLogin({required this.id, required this.nome, required this.email, required this.funcao});

  factory UserLogin.fromList(Map<String, dynamic> values) {
    return UserLogin(
      id: valueByKey(values, 'id'),
      nome: valueByKey(values, 'nome'),
      email: valueByKey(values, 'email'),
      funcao: Funcao.fromName(valueByKey(values, 'funcao')),
    );
  }
}

dynamic valueByKey(Map<String, dynamic> values, String key) {
  if (!values.containsKey(key)) return '';

  for (final entry in values.entries) {
    if (entry.key.contains(key)) return entry.value;
  }

  return '';
}