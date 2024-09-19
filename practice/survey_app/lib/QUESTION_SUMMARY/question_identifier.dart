import 'package:flutter/material.dart';
import 'package:survey_app/QUESTION_SUMMARY/question_number.dart';

// ignore: must_be_immutable
class QuestionIdentifier extends StatelessWidget {
  QuestionIdentifier(this.data, {super.key});

  dynamic item;
  Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    final bool isCorrect = data['user_answer'] == data['correct_answer'];
    return Row(
      children: [
        QuestionNumber(isCorrect, data['question_index'] as int),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['question'].toString(),
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                data['user_answer'].toString(),
                style: TextStyle(
                  color: isCorrect ? Colors.green : Colors.red,
                ),
              ),
              Text(
                data['correct_answer'].toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
