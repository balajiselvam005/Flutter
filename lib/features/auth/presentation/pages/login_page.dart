import 'package:flutter/material.dart';
import 'package:peakpulse_test1/core/util/reuseable%20widget/custom_snackbar.dart';
import 'package:peakpulse_test1/core/util/theme/themes.dart';
import 'package:peakpulse_test1/features/auth/methods/auth_methods.dart';
import 'package:peakpulse_test1/features/auth/presentation/pages/reset%20password/reset_email.dart';
import 'package:peakpulse_test1/features/auth/presentation/widgets/auth_fields.dart';
import 'package:peakpulse_test1/features/auth/presentation/widgets/submit_button.dart';
import 'package:peakpulse_test1/main%20screen%20layout/tab_layout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  void logInUser() async {
    setState(() {
      _isLoading = true;
    });

    final res = await AuthMethods().logInUser(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (res != "success") {
      showSnackBar(res, context);
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (ctx) => const TabLayout(),
      //   ),
      // );
      Navigator.of(context).pop();
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'welcome',
            child: Text(
              "Welcome back!",
              style: theme.titleLarge,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            "Excited to see you again!",
            style: theme.bodyMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          AuthFields(
            textController: _emailController,
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 25,
          ),
          AuthFields(
            textController: _passwordController,
            hintText: "Enter password",
            keyboardType: TextInputType.none,
            isPass: true,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const ResetViaEmail(),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero(
                  tag: 'forgotpassword',
                  child: Text(
                    "Forget password?",
                    style: theme.bodyMedium!.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Hero(
            tag: 'LoginPagein',
            child: SubmitButton(
              onTap: logInUser,
              label: "Log In",
              color: pallete.bgColor,
              isLoading: _isLoading,
            ),
          ),
        ],
      ),
    );
  }
}
