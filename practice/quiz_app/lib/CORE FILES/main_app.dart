import 'package:flutter/material.dart';
import 'package:survey_app/DATA/question.dart';
import 'package:survey_app/SCREENS/start_screen.dart';
import 'package:survey_app/SCREENS/question_screen.dart';
import 'package:survey_app/SCREENS/result_screen.dart';
import 'package:survey_app/SCREENS/view_result_screen.dart';

class Survey extends StatefulWidget {
  const Survey({super.key});

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  var content = 'start-screen';
  List<String> selectedAnswers = [];

  void changeScreen() {
    setState(() {
      if (content == 'view-result') {
        content = 'result-screen';
      } else if (content == 'result-screen') {
        content = 'start-screen';
      } else {
        content = 'question-screen';
      }
    });
  }

  void chooseAnswer(var answer) {
    selectedAnswers.add(answer);
    if (questions.length == selectedAnswers.length) {
      setState(() {
        content = 'view-result';
      });
    }
  }

  void resetScreen() {
    setState(() {
      selectedAnswers = [];
      content = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(onTap: changeScreen);

    if (content == 'question-screen') {
      screenWidget = QuestionScreen(chooseAnswer);
    } else if (content == 'view-result') {
      screenWidget = ViewResult(changeScreen);
    } else if (content == 'result-screen') {
      screenWidget = ResultScreen(
          ontap: changeScreen,
          reset: resetScreen,
          choosenAnswers: selectedAnswers);
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Survey App"),
          backgroundColor: Colors.purple.shade800,
          shadowColor: Colors.purple.shade800,
          elevation: 20,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple.shade800,
                Colors.purple.shade700,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
