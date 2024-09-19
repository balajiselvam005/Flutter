import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuestionNumber extends StatelessWidget {
  QuestionNumber(this.isCorrect, this.questionIndex, {super.key});

  final bool isCorrect;
  int questionIndex;

  @override
  Widget build(BuildContext context) {
    final int questionNumber = questionIndex + 1;

    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrect ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNumber.toString(),
      ),
    );
  }
}
