import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final bool isFull;
  final void Function()? onPressed;

  const Button({
    super.key,
    required this.title,
    this.isFull = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: isFull ? double.infinity : null,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(padding: const EdgeInsets.only(right: 30, left: 30), backgroundColor: Colors.red),
          child: Text(title),
        ),
      ),
    );
  }
}