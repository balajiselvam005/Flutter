import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox({
    super.key,
    required this.textController,
    required this.hintText,
    required this.keyboardType,
    this.isPass = false,
  });
  final TextEditingController textController;
  final String hintText;
  final bool isPass;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    return Container(
      alignment: Alignment.center,
      child: TextField(
        controller: textController,
        obscureText: isPass,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          filled: true,
        ),
      ),
    );
  }
}
