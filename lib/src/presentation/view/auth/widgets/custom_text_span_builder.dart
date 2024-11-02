import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class CustomTextSpanBuilder {
  static TextSpan buildTextSpan({
    required String text,
    Color color = Colors.black,
  }) {
    return TextSpan(
      text: text,
      style: AppTypography.poppinsRegular.copyWith(
        letterSpacing: 0.12,
        color: color,
        fontSize: 12.sp,
      ),
    );
  }
}
