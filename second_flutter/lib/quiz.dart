import 'package:flutter/material.dart';
import 'package:second_flutter/data/questions.dart';
import 'package:second_flutter/questions_screen.dart';
import 'package:second_flutter/results_screen.dart';
import 'package:second_flutter/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  /*
  // 利用组件加载时的状态进行赋值
  Widget? activeScreen;  // ? 表示activeScreen可以为null 或者 Widget 类型

  // 这个函数表示在组建构建之前先执行的内容
  @override
  void initState() {
    // TODO: implement initState
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen();
    });
  }*/
  List<String> selectedAnswers = []; // 保存所选择的答案
  var _activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      _activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        _activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      _activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    // 相当于vue中存放计算方法
    /*final screenWidget = _activeScreen == 'start-screen'
        ? StartScreen(switchScreen)
        : QuestionScreen(onSelectAnswer: chooseAnswer);*/

    // If 方法演示
    Widget screenWidget = StartScreen(switchScreen);

    if (_activeScreen == 'questions-screen') {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }

    if(_activeScreen == 'results-screen'){
      screenWidget = ResultsScreen(chosenAnswers:selectedAnswers,onRestart: restartQuiz,);
    }

    return MaterialApp(
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
          child: screenWidget,
        ),
      ),
    );
  }
}
