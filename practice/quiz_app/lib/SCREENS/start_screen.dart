import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({required this.onTap, super.key});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/Images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(53, 255, 255, 255),
          ),
          const SizedBox(
            height: 100,
          ),
          const Text(
            'Learn the Flutter fun way',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton.icon(
            onPressed: onTap,
            icon: const Icon(Icons.arrow_forward),
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
            label: const Text('START SURVEY'),
          ),
        ],
      ),
    );
  }
}
