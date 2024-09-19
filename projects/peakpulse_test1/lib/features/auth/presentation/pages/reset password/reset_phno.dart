import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peakpulse_test1/core/util/reuseable%20widget/back_button.dart';
import 'package:peakpulse_test1/core/util/theme/themes.dart';
import 'package:peakpulse_test1/features/auth/presentation/pages/reset%20password/reset_email.dart';
import 'package:peakpulse_test1/features/auth/presentation/widgets/auth_fields.dart';
import 'package:peakpulse_test1/features/auth/presentation/widgets/submit_button.dart';

class ResetViaPhoneNumber extends StatefulWidget {
  const ResetViaPhoneNumber({super.key});

  @override
  State<ResetViaPhoneNumber> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetViaPhoneNumber> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/vectors/forgot-password.svg',
            ),
            const SizedBox(
              height: 77,
            ),
            Hero(
              tag: 'forgotpassword',
              child: RichText(
                text: TextSpan(
                  text: 'Forgot password?',
                  style: theme.titleSmall,
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              'Reset via otp',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 29,
            ),
            AuthFields(
              textController: _emailController,
              hintText: "Enter phone number",
              keyboardType: TextInputType.number,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const ResetViaEmail(),
                  ),
                );
              },
              child: Text(
                'reset using email',
                style: theme.bodyMedium!.copyWith(
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 29,
            ),
            SubmitButton(
              onTap: () {},
              label: 'Send otp',
              color: pallete.mainColor,
            ),
          ],
        ),
      ),
    );
  }
}
