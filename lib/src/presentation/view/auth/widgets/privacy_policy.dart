import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/view/auth/widgets/custom_text_span_builder.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 104.h),
      width: 350.w,
      child: Text.rich(
        TextSpan(
          children: [
            CustomTextSpanBuilder.buildTextSpan(
              text: 'By creating or logging into an account you are agreeing with our',
            ),
            CustomTextSpanBuilder.buildTextSpan(
              text: 'Terms and Conditions',
              color: const Color(0xFF0028FC),
            ),
            CustomTextSpanBuilder.buildTextSpan(
              text: ' and ',
            ),
            CustomTextSpanBuilder.buildTextSpan(text: 'Privacy Policy.', color: const Color(0xFF0028FC)),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
