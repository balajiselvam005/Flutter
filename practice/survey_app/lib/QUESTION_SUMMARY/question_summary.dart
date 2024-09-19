import 'package:flutter/material.dart';
import 'package:survey_app/QUESTION_SUMMARY/question_identifier.dart';

@immutable
// ignore: must_be_immutable
class QuestionSummary extends StatelessWidget {
  QuestionSummary(this.summaryData, {super.key});

  List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map(
              (data) {
                return QuestionIdentifier(data);
              },
            ),
          ],
        ),
      ),
    );
  }
}
