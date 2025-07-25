import 'package:flutter/material.dart';
import 'package:second_flutter/my_text.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  Color compareData(String a, String b) {
    return a == b ? Colors.greenAccent.shade100 : Colors.redAccent.shade100;
  }

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment:CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: compareData(
                      data['question_answer'] as String,
                      data['question_chosen'] as String,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: MyText(
                    text: ((data['question_index'] as int) + 1).toString(),
                    size: 16,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: data['question'] as String,
                        size: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 5),
                      MyText(
                        text:
                            'question_chosen: ${data['question_chosen'] as String}',
                        size: 16,
                        color: Colors.orangeAccent.shade200,
                      ),
                      MyText(
                        text:
                            'question_answer: ${data['question_answer'] as String}',
                        size: 16,
                        color: Colors.greenAccent.shade400,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

/*[
Text('回答了 x 个问题'),
SizedBox(height: 30),
Text('问题列表:'),
SizedBox(height: 30),
TextButton(onPressed: () {}, child: Text('asdasd')),
],*/
