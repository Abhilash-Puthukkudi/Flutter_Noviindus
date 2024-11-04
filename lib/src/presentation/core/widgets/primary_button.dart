import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback onPressed;
  final double? fontsize;
  final Color? color;
  final TextStyle? fontStyle;

  const PrimaryButton({
    super.key,
    this.text,
    this.child,
    this.fontsize,
    required this.onPressed,
    this.color,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.52.r),
          ),
        ),
        child: SizedBox(
          child: child ??
              Text(
                text ?? '',
                style: fontStyle ??
                    AppTypography.poppinsSemiBold.copyWith(
                      color: Colors.white,
                      fontSize: fontsize ?? 17.sp,
                      fontWeight: FontWeight.w600,
                    ),
              ),
        ),
      ),
    );
  }
}
