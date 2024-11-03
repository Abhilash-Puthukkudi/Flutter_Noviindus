import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_images.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      height: 40.h,
      padding: const EdgeInsets.symmetric(vertical: 11).copyWith(left: 10.w),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.w,
            color: Colors.black.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20.w,
            height: 20.h,
            child: Image.asset(AppImages.searchIcon),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: TextFormField(
              style: AppTypography.poppinsRegular.copyWith(
                color: AppColors.borderColor,
                fontSize: 12.sp,
              ),
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 7.h),
                hintText: hintText,
                hintStyle: AppTypography.poppinsRegular.copyWith(
                  color: AppColors.borderColor,
                  fontSize: 12.sp,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
