import 'package:flutter/material.dart';
import 'package:survey_app/DATA/question.dart';
import 'package:survey_app/QUESTION_SUMMARY/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.ontap, required this.reset,required this.choosenAnswers});

  final void Function() ontap;
  final List<String> choosenAnswers;
  final void Function() reset;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < choosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': choosenAnswers[i],
        },
      );
    }

    return summary;
  }

  /*int calc(){
    int c = 0;
    for(int i=0;i<choosenAnswers.length;i++){
      if(choosenAnswers[i] == questions[i].answers[0]){
        c++;
      }
    }
    return c;
  }*/

  @override
  Widget build(BuildContext context) {
    final totalNumberOfQuestion = choosenAnswers.length;
    final int numberOfCorrectAnswers = summaryData.where(
      (data) {
        return data['user_answer'] == data['correct_answer'];
      },
    ).length;

    return Center(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'You answered $numberOfCorrectAnswers out of $totalNumberOfQuestion questions correctly!',
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionSummary(summaryData),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                onPressed: reset,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple.shade700,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                icon: const Icon(Icons.restart_alt),
                label: const Text('Restart'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
