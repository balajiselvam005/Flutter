import 'package:flutter/material.dart';
import 'package:peakpulse_test1/core/util/theme/themes.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: pallete.mainColor,
          size: 30,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
  }
}
