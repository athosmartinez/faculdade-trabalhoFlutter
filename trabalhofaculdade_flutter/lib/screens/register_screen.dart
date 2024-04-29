import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Gender { male, female, other }

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Gender? _gender = Gender.other; // Valor padrão

  Widget _buildGenderRadio(String title, Gender value) {
    return RadioListTile<Gender>(
      title: Text(title),
      value: value,
      groupValue: _gender,
      onChanged: (Gender? newValue) {
        setState(() {
          _gender = newValue!;
        });
      },
      dense: true,
    );
  }


  bool _obscureText = true;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _documentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Image.asset("assets/images/img_logo.png",
                      width: 200, height: 200),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Nome', prefixIcon: Icon(Icons.person)),
                  controller: _nameController,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      Icon(Icons.transgender),
                      Text("Gênero"),
                    ],
                  ),
                ),
                _buildGenderRadio('Masculino', Gender.male),
                _buildGenderRadio('Feminino', Gender.female),
                _buildGenderRadio('Outros', Gender.other),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Email', prefixIcon: Icon(Icons.email)),
                  controller: _emailController,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ], // Permite apenas dígitos
                  decoration: const InputDecoration(
                      hintText: 'Telefone', prefixIcon: Icon(Icons.smartphone)),
                ),
                TextFormField(
                  controller: _documentController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                  decoration: const InputDecoration(
                      hintText: 'CPF', prefixIcon: Icon(Icons.edit_document)),
                  // Você pode adicionar mais lógica aqui, se necessário
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  obscureText: _obscureText,
                  controller: _passwordController,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                _buildRegisterButton()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                if (ModalRoute.of(context)?.settings.name != 'loginScreen') {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    'loginScreen',
                    (Route<dynamic> route) => false,
                  );
                }
              },
              child: const Text('Login', style: TextStyle(fontSize: 18)),
            ),
            TextButton(
              onPressed: () {
                if (ModalRoute.of(context)?.settings.name != 'registerScreen') {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    'registerScreen',
                    (Route<dynamic> route) => false,
                  );
                }
              },
              child: const Text('Registrar', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildRegisterButton() {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: ElevatedButton(
      onPressed: () {
        // Aqui você pode usar _emailController.text e _passwordController.text
        // para obter os valores inseridos nos campos de texto
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
      ),
      child: const Text('Registrar'),
    ),
  );
}

class CpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(RegExp(r'\D'), '');
    String formattedText = '';

    for (int i = 0; i < newText.length; i++) {
      if (i == 3 || i == 6) {
        formattedText += '.';
      } else if (i == 9) {
        formattedText += '-';
      }
      formattedText += newText[i];
    }

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
