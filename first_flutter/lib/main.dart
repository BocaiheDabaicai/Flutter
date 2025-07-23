import 'package:flutter/material.dart';

import 'gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 217, 227, 246),
        // body: GradientContainer(colors:[Colors.indigo.shade50, Colors.orange.shade50]),
        body: GradientContainer.mine(),
      ),
    ),
  );
}
