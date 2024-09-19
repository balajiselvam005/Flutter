import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnswerButton extends StatelessWidget {
  AnswerButton({required this.answer, required this.onTap, super.key});
  String answer;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 80,
            right: 80,
          ),
          backgroundColor: Colors.purple.shade700,
          foregroundColor: Colors.white,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          )),
      child: Text(answer),
    );
  }
}
