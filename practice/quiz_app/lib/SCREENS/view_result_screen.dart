import 'package:flutter/material.dart';

class ViewResult extends StatelessWidget {
  const ViewResult(this.onTap, {super.key});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
            label: const Text('VIEW RESULT'),
          ),
        ],
      ),
    );
  }
}
