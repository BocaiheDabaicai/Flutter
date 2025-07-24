import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/quiz-logo.png', width: 300),
          const SizedBox(height: 80),
          Text(
            '这里可以做知识问答',
            style: TextStyle(color: Colors.black87, fontSize: 24),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: EdgeInsetsGeometry.all(20),
              foregroundColor: Colors.white
            ),
            child: Text(
              '开始答题',
              style: TextStyle(fontSize: 24, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}