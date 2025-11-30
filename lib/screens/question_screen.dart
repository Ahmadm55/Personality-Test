import 'package:flutter/material.dart';
import '../models/question.dart';
import '../models/answer.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  final void Function(Answer) onAnswerSelected;
  final int questionIndex;
  final int total;

  const QuestionScreen({
    Key? key,
    required this.question,
    required this.onAnswerSelected,
    required this.questionIndex,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Question ${questionIndex + 1} of $total')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question.text, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 20),
            ...question.answers.map(
              (a) => Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  onPressed: () => onAnswerSelected(a),
                  child: Text(a.text),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
