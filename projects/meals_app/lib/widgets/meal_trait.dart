import 'package:flutter/material.dart';

class MealTrait extends StatelessWidget {
  const MealTrait({
    super.key,
    required this.icon,
    required this.label,
  });
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 23,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          label,
          maxLines: 2,
          textAlign: TextAlign.center,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
