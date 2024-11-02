import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback onPressed;
  final double? fontsize;

  const PrimaryButton({
    super.key,
    this.text,
    this.child,
    this.fontsize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.52.r),
          ),
        ),
        child: SizedBox(
          child: child ??
              Text(
                text ?? '',
                style: AppTypography.poppinsSemiBold.copyWith(
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
