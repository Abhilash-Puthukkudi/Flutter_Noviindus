import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CircularProgressIndicator(
        strokeCap: StrokeCap.round,
        color: AppColors.scaffoldColor,
        backgroundColor: AppColors.primaryColor,
        strokeWidth: 4.r,
      ),
    );
  }
}
