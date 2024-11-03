import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_images.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class EmptyPlaceHolder extends StatelessWidget {
  const EmptyPlaceHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(padding: EdgeInsets.only(top: 100.h), children: [
        SizedBox(
            height: 100.h,
            width: 100.w,
            child: Center(
                child: Image.asset(
              AppImages.noDataIcon,
              color: AppColors.borderColor,
            ))),
        Center(
            child: const Text(
          'No Patients Available',
          style: AppTypography.poppinsLight,
        ))
      ]),
    );
  }
}
