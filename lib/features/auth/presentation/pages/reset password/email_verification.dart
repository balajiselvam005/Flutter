import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peakpulse_test1/core/util/reuseable%20widget/back_button.dart';
import 'package:peakpulse_test1/core/util/theme/themes.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
        ),
        body: Center(
          child: Container(
            height: 500,
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/vectors/mail-sent.svg',
                  width: 251.3,
                  height: 178.14,
                ),
                const SizedBox(
                  height: 48.56,
                ),
                Text(
                  'Check your e-mail\nfor verification to\nproceed',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        height: 1.1,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Didn’t get a mail ',
                    style: GoogleFonts.barlow(
                      color: pallete.secondaryColor,
                      fontSize: 19,
                    ),
                    children: [
                      TextSpan(
                        text: 'resend?',
                        style: GoogleFonts.barlow(
                            color: pallete.secondaryColor,
                            fontSize: 19,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
