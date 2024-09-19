import 'package:flutter/material.dart';
import 'package:peakpulse_test1/core/util/theme/color_pallete.dart';

class AuthFields extends StatelessWidget {
  const AuthFields({
    super.key,
    required this.textController,
    required this.hintText,
    required this.keyboardType,
    this.isPass = false,
  });
  final bool isPass;
  final TextInputType keyboardType;
  final TextEditingController textController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 25,
        color: ColorPallete().secondaryColor,
      ),
      cursorHeight: 35,
      controller: textController,
      keyboardType: keyboardType,
      obscureText: isPass,
      decoration: InputDecoration(
        labelText: hintText,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "$hintText is missing!";
        }
        return null;
      },
    );
  }
}
