import 'package:flutter/material.dart';
import 'package:peakpulse_test1/core/util/reuseable%20widget/custom_snackbar.dart';
import 'package:peakpulse_test1/core/util/theme/themes.dart';
import 'package:peakpulse_test1/features/auth/methods/auth_methods.dart';
import 'package:peakpulse_test1/features/auth/presentation/widgets/auth_fields.dart';
import 'package:peakpulse_test1/features/auth/presentation/widgets/submit_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isLoading = false;
  final authSpace = const SizedBox(
    height: 23,
  );

  void signUpScreen() async {
    setState(() {
      _isLoading = true;
    });

    final res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _nameController.text,
      // bio: _bioController.text,
      context: context,
      // file: _image!,
    );

    if (res != 'success') {
      showSnackBar(res, context);
    }

    setState(() {
      _isLoading = false;
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: 'welcome',
          child: RichText(
            text: TextSpan(
              text: 'Welcome to ',
              style: theme.titleSmall,
              children: [
                TextSpan(
                  text: 'PeakPulse',
                  style: theme.titleSmall!.copyWith(
                    color: pallete.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          "Let's sign up together !",
          style: theme.bodyMedium,
        ),
        const SizedBox(
          height: 26,
        ),
        AuthFields(
          textController: _nameController,
          hintText: "Fullname",
          keyboardType: TextInputType.name,
        ),
        authSpace,
        AuthFields(
          textController: _emailController,
          hintText: "Email",
          keyboardType: TextInputType.emailAddress,
        ),
        authSpace,
        AuthFields(
          textController: _passwordController,
          hintText: "Create Password",
          keyboardType: TextInputType.none,
          isPass: true,
        ),
        authSpace,
        AuthFields(
          textController: _confirmPasswordController,
          hintText: "Confirm Password",
          keyboardType: TextInputType.none,
          isPass: true,
        ),
        const SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 5.0,
            bottom: 24,
          ),
          child: RichText(
            text: TextSpan(
              text: 'By continuing, i agree to peakpulse ',
              style: theme.bodySmall!.copyWith(
                color: pallete.secondaryColor,
              ),
              children: [
                TextSpan(
                  text: 'Terms of services',
                  style: theme.bodySmall!.copyWith(
                    color: pallete.mainColor,
                    decoration: TextDecoration.underline,
                    decorationColor: pallete.mainColor,
                  ),
                ),
                TextSpan(
                  text: ' and acknowledge the ',
                  style: theme.bodySmall!.copyWith(
                    color: pallete.secondaryColor,
                  ),
                ),
                TextSpan(
                  text: 'private policy',
                  style: theme.bodySmall!.copyWith(
                    color: pallete.mainColor,
                    decoration: TextDecoration.underline,
                    decorationColor: pallete.mainColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        authSpace,
        Hero(
          tag: 'signup',
          child: SubmitButton(
            onTap: signUpScreen,
            label: "Sign Up",
            color: pallete.mainColor,
            isLoading: _isLoading,
          ),
        ),
      ],
    );
  }
}
