import 'package:flutter/material.dart';
import 'package:second_flutter/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 217, 227, 246),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo.shade50, Colors.orange.shade50],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: StartScreen(),
        ),
      ),
    ),
  );
}
