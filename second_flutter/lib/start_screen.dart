import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key, required});

  final void Function() startQuiz;

  void start() {
    startQuiz();
  }

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Color.fromARGB(180, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          Text(
            '这里可以做知识问答',
            style: GoogleFonts.delius(color: Colors.black87, fontSize: 24),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: start,
            style: OutlinedButton.styleFrom(
              padding: EdgeInsetsGeometry.all(20),
              foregroundColor: Colors.black87,
            ),
            icon: Icon(Icons.description, size: 24),
            label: Text(
              '开始答题',
              style: GoogleFonts.delius(fontSize: 24, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
