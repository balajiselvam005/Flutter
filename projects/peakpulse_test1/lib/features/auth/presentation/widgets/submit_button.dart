import 'package:flutter/material.dart';
import 'package:peakpulse_test1/core/util/theme/themes.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.onTap,
    required this.label,
    this.isLoading = false,
    this.color,
  });
  final void Function() onTap;
  final String label;
  final bool isLoading;
  final color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220,
        height: 51.3,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: SizedBox.expand(
          child: OutlinedButton(
            onPressed: onTap,
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                width: 1.5,
                color: pallete.mainColor,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: pallete.secondaryColor,
                    ),
                  )
                : Text(
                    label,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
          ),
        ),
      ),
    );
  }
}
