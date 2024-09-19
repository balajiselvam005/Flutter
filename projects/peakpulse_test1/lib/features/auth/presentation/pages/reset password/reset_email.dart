import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peakpulse_test1/core/util/reuseable%20widget/back_button.dart';
import 'package:peakpulse_test1/core/util/theme/themes.dart';
import 'package:peakpulse_test1/features/auth/presentation/pages/reset%20password/email_verification.dart';
import 'package:peakpulse_test1/features/auth/presentation/pages/reset%20password/reset_phno.dart';
import 'package:peakpulse_test1/features/auth/presentation/widgets/auth_fields.dart';
import 'package:peakpulse_test1/features/auth/presentation/widgets/submit_button.dart';

class ResetViaEmail extends StatefulWidget {
  const ResetViaEmail({super.key});

  @override
  State<ResetViaEmail> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetViaEmail> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              'Reset via email',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 29,
            ),
            AuthFields(
              textController: _emailController,
              hintText: "Enter email",
              keyboardType: TextInputType.emailAddress,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => const ResetViaPhoneNumber(),
                  ),
                );
              },
              child: Text(
                'reset using phone number',
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
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const EmailVerification(),
                  ),
                );
              },
              label: 'Send link',
              color: pallete.mainColor,
            ),
          ],
        ),
      ),
    );
  }
}
