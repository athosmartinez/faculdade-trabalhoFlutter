import 'package:flutter/material.dart';
import 'package:trabalhofaculdade_flutter/model/edit_user.dart';
import 'package:trabalhofaculdade_flutter/screens/components/text_field.dart';
import 'package:trabalhofaculdade_flutter/supabase/profile.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final EditUser user = EditUser();
  
  bool _isLoading = false;

  Future<void> _updateProfile(BuildContext context) async {
    setState(() => _isLoading = true);
    await updateProfile(context, user);
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); 
          },
        ),
      ),
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
                      controller: user.nome,
                    ),
                    CustomTextFormField(
                      hintText: 'Email Antigo',
                      prefixIcon: Icons.email,
                      controller: user.emailAntigo,
                    ),
                    CustomTextFormField(
                      hintText: 'Email Novo',
                      prefixIcon: Icons.email,
                      controller: user.emailNovo,
                    ),
                    CustomTextFormField(
                      hintText: 'Senha Antiga',
                      prefixIcon: Icons.lock,
                      controller: user.senhaAntiga,
                      obscureText: true,
                      isPasswordField: true,
                    ),
                    CustomTextFormField(
                      hintText: 'Senha Nova',
                      prefixIcon: Icons.lock,
                      controller: user.senhaNova,
                      obscureText: true,
                      isPasswordField: true,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (!_isLoading) {
                          _updateProfile(context);
                        }
                      },
                      child: const Text('Salvar'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
