import 'package:flutter/material.dart';
import 'package:trabalhofaculdade_flutter/themes/colors_themes.dart';
import './components/bottom_navigation.dart';
import './components/drawer.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, "pedidosGarcomScreen");
          },
        ),
      ),
      drawer: const DrawerScreen(), 
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 50, color: Colors.grey[800]),
            ),
            const SizedBox(height: 8),
            const Text(
              'Editar foto',
              style: TextStyle(color: Colors.blue),
            ),
            const SizedBox(height: 16),
            _buildTextField(Icons.person, 'Editar nome'),
            const SizedBox(height: 16),
            _buildTextField(Icons.email, 'Editar email'),
            const SizedBox(height: 16),
            _buildTextField(Icons.lock, 'Altera senha', obscureText: true),
            const SizedBox(height: 16),
            _buildTextField(Icons.lock, 'Senha anterior', obscureText: true),
            const SizedBox(height: 16),
            const Text(
              'Para alterar a senha tem que colocar a senha anterior',
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: BottomColors.buttonStyle,
              onPressed: () {},
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(
        param1: ParamBottomNavigation(
            label: "Pedidos",
            icon: Icons.list_alt,
            route: "pedidosGarcomScreen"),
        param2: ParamBottomNavigation(
            label: "Perfil", icon: Icons.person, route: "perfilGarcomScreen"),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hintText, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
