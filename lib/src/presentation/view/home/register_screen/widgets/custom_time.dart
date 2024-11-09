import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class CustomTimeField extends StatelessWidget {
  final String hintText;

  const CustomTimeField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170.w, // Using .w for responsive width
      height: 50.h, // Using .h for responsive height
      padding: EdgeInsets.symmetric(
          horizontal: 15.w, vertical: 13.h), // Responsive padding
      decoration: ShapeDecoration(
        color: const Color(0x3FD9D9D9),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.85.w, // Responsive border width
            color: Colors.black.withOpacity(0.1),
          ),
          borderRadius:
              BorderRadius.circular(8.53.r), // Responsive border radius
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: AppTypography.poppinsRegular.copyWith(
                  color: Colors.black.withOpacity(0.4),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                ),
                contentPadding: EdgeInsets.zero,
              ),
              style: AppTypography.poppinsRegular.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            size: 18.w, // Responsive icon size
            color: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
