import 'package:trabalhofaculdade_flutter/supabase/config.dart';

Future<void> addTable(String tableNumber) async {
  try {

    final response = await supabase
        .from('mesa')
        .select()
        .eq('numero', tableNumber)
        .maybeSingle();

    if (response != null) {
      throw Exception('Mesa com o número $tableNumber já existe.');
    }

    // Se não existir, insere a nova mesa
    await supabase.from('mesa').insert({'numero': tableNumber});
  } on Exception catch (error) {
    throw Exception('Erro ao adicionar mesa: $error');
  }
}

Future<List<String>> fetchTables() async {
  try {
    final response = await supabase.from('mesa').select('numero');
    List<String> tables = (response as List).map<String>((row) => row['numero'].toString()).toList();
    return tables;
  } on Exception catch (error) {
    throw Exception('Erro ao buscar mesas: $error');
  }
}

Future<void> deleteTable(String tableNumber) async {
  try {
    await supabase.from('mesa').delete().eq('numero', tableNumber);
  } on Exception catch (error) {
    throw Exception('Erro ao deletar mesa: $error');
  }
}
