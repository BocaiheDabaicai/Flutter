import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  // TextWidget(String text, {super.key}) : text = text;
  const TextWidget(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: Colors.deepPurple, fontSize: 28));
  }
}
