import 'package:flutter/material.dart';
import 'package:second_flutter/data/questions.dart';
import 'package:second_flutter/question_summary.dart';

import 'my_text.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'question_answer': questions[i].answers[0],
        'question_chosen': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['question_answer'] == data['question_chosen'];
    }).length;

    return SizedBox(
      width: double.infinity, // 最大宽度
      child: Container(
        margin: EdgeInsets.all(160),
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(
              text: '回答 $numTotalQuestions 个问题, 回答正确 $numCorrectQuestions 个问题！',
            ),
            SizedBox(height: 30),
            QuestionSummary(summaryData),
            SizedBox(height: 30),
            TextButton.icon(
              onPressed: () {},
              style: ButtonStyle(
                padding: WidgetStateProperty.all(EdgeInsets.all(20)),
              ),
              icon: Icon(Icons.refresh, size: 32, color: Colors.black87),
              label: MyText(text: '重新答题'),
            ),
          ],
        ),
      ),
    );
  }
}
