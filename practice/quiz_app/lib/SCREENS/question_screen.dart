import 'package:flutter/material.dart';
import 'package:survey_app/DATA/question.dart';
import 'package:survey_app/STYLE/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.onTap, {super.key});

  final void Function(String) onTap;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void nextQuestion(var answer) {
    widget.onTap(answer);
    if (currentQuestionIndex == questions.length - 1) {
      setState(() {
        currentQuestionIndex = 0;
      });
    } else {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.shuffledAnswers.map(
              (answer) {
                return AnswerButton(
                  answer: answer,
                  onTap: () {
                    nextQuestion(answer);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
