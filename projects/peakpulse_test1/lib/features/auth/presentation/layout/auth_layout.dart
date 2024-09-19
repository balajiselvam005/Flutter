import 'package:flutter/material.dart';
import 'package:peakpulse_test1/core/util/reuseable%20widget/back_button.dart';
import 'package:peakpulse_test1/core/util/theme/color_pallete.dart';
import 'package:peakpulse_test1/features/auth/presentation/pages/login_page.dart';
import 'package:peakpulse_test1/features/auth/presentation/pages/signup_page.dart';

class AuthLayout extends StatefulWidget {
  const AuthLayout({
    super.key,
    required this.isSignUp,
  });

  final bool isSignUp;

  @override
  State<AuthLayout> createState() => _AuthLayoutState();
}

class _AuthLayoutState extends State<AuthLayout> {
  final pallete = ColorPallete();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: pallete.bgColor,
        body: Padding(
          padding: const EdgeInsets.all(27),
          child: widget.isSignUp ? const SignupPage() : const LoginPage(),
        ),
      ),
    );
  }
}
