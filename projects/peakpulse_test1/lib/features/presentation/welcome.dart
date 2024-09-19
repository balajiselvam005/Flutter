import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peakpulse_test1/core/util/reuseable%20widget/back_button.dart';
import 'package:peakpulse_test1/core/util/theme/themes.dart';
import 'package:peakpulse_test1/features/auth/presentation/layout/auth_layout.dart';
import 'package:peakpulse_test1/features/auth/presentation/widgets/submit_button.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<Welcome> {
  void enter(BuildContext context, bool isSignUp) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => AuthLayout(
          isSignUp: isSignUp,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: const CustomBackButton(),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/vectors/gym.svg',
              ),
              const SizedBox(
                height: 10,
              ),
              Hero(
                tag: 'welcome',
                child: RichText(
                  text: TextSpan(
                    text: "Get started\n",
                    style: theme.titleLarge,
                    children: [
                      TextSpan(
                        text: "now!",
                        style: theme.titleLarge!.copyWith(
                          color: pallete.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Hero(
                tag: 'signup',
                child: SubmitButton(
                  onTap: () {
                    enter(context, true);
                  },
                  label: "SignUp",
                  color: pallete.mainColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Hero(
                tag: 'signin',
                child: SubmitButton(
                  onTap: () {
                    enter(context, false);
                  },
                  label: "Log In",
                  color: pallete.bgColor,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Continue as guest?",
                  style: theme.bodyMedium!.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
