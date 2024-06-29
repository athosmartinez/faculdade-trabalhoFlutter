import 'package:trabalhofaculdade_flutter/supabase/config.dart';

Future<void> addTable(String tableNumber) async {
  try {
    final response = await supabase
        .from('mesa')
        .select()
        .eq('numero', tableNumber)
        .maybeSingle();

    if (response != null) {
      throw 'Mesa com o número $tableNumber já existe.';
    }

    await supabase.from('mesa').insert({'numero': tableNumber});
  } catch (error) {
    throw 'Erro ao adicionar mesa: ${error.toString()}';
  }
}

Future<List<String>> fetchTables() async {
  try {
    final response = await supabase.from('mesa').select('numero');
    List<String> tables = (response as List).map<String>((row) => row['numero'].toString()).toList();
    return tables;
  } catch (error) {
    throw 'Erro ao buscar mesas: ${error.toString()}';
  }
}

Future<void> deleteTable(String tableNumber) async {
  try {
    await supabase.from('mesa').delete().eq('numero', tableNumber);
  } catch (error) {
    throw 'Erro ao deletar mesa: ${error.toString()}';
  }
}
