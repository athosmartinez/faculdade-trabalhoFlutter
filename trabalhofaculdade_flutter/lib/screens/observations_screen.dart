import 'package:flutter/material.dart';
import 'package:trabalhofaculdade_flutter/screens/components/button.dart';

class ObservationsScreen extends StatefulWidget {
  const ObservationsScreen({Key? key}) : super(key: key);

  @override
  State<ObservationsScreen> createState() => _ObservationsScreenState();
}

class _ObservationsScreenState extends State<ObservationsScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Observações'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                maxLines: null,
                expands: true,
                keyboardType: TextInputType.multiline,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  hintText: 'Observações',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Button(
              title: 'Salvar',
              isFull: true,
              onPressed: () {
                print('Observações salvas: ${_controller.text}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
