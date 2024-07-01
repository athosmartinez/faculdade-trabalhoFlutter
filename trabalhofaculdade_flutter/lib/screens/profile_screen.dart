import 'package:flutter/material.dart';
import 'package:trabalhofaculdade_flutter/model/edit_user.dart';
import 'package:trabalhofaculdade_flutter/screens/components/text_field.dart';
import 'package:trabalhofaculdade_flutter/supabase/profile.dart';
import 'package:trabalhofaculdade_flutter/model/funcao.dart';
import 'package:trabalhofaculdade_flutter/util/globals.dart'; // Importar o arquivo onde user está definido
// Importações adicionais
import '../screens/components/app_bar_interna.dart';
import '../screens/components/drawer.dart';
import '../screens/components/bottom_navigation.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final EditUser editUser = EditUser();
  
  bool _isLoading = false;

  Future<void> _updateProfile(BuildContext context, EditUser user) async {
    setState(() => _isLoading = true);
    if (user.emailAntigo.text.isEmpty || user.senhaAntiga.text.isEmpty) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, forneça o email antigo e a senha antiga.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      await updateProfile(context, user);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao atualizar perfil: $error'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  bool isGarcom() {
    return user != null && user!.funcao == Funcao.garcom;
  }

  bool isCozinheiro() {
    return user != null && user!.funcao == Funcao.cozinheiro;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Perfil'),
      drawer: const DrawerScreen(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey,
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt),
                        onPressed: () {
                          // Implementar a função para editar a foto
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      hintText: 'Nome',
                      prefixIcon: Icons.person,
                      controller: editUser.nome,
                    ),
                    CustomTextFormField(
                      hintText: 'Email Atual',
                      prefixIcon: Icons.email,
                      controller: editUser.emailAntigo,
                    ),
                    CustomTextFormField(
                      hintText: 'Email Novo',
                      prefixIcon: Icons.email,
                      controller: editUser.emailNovo,
                    ),
                    CustomTextFormField(
                      hintText: 'Senha Atual',
                      prefixIcon: Icons.lock,
                      controller: editUser.senhaAntiga,
                      obscureText: true,
                      isPasswordField: true,
                    ),
                    CustomTextFormField(
                      hintText: 'Senha Nova',
                      prefixIcon: Icons.lock,
                      controller: editUser.senhaNova,
                      obscureText: true,
                      isPasswordField: true,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        'Para salvar as alterações, forneça o email antigo e a senha antiga.',
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (!_isLoading) {
                          _updateProfile(context, editUser);
                        }
                      },
                      child: const Text('Salvar'),
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: BottomNavigation(
        param1: ParamBottomNavigation(
          label: "Pedidos",
          icon: Icons.list_alt,
          route: isCozinheiro() ? "cozinheiroScreen" : "pedidosGarcomScreen",
        ),
        param2: const ParamBottomNavigation(
          label: "Perfil",
          icon: Icons.person,
          route: "perfilGarcomScreen",
        ),
      ),
    );
  }
}
