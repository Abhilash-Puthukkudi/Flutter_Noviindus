import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_images.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class NamedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const NamedAppBar({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(154.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 154.h,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.borderColor)),
        color: Colors.white,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25.0.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0.w),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                // Bell icon
                Padding(
                  padding: EdgeInsets.only(right: 50.0.w),
                  child: IconButton(
                    icon: Badge(alignment: const Alignment(0.65, -0.6), child: Image.asset(height: 28.h, width: 28.w, AppImages.bellIcon)),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.w),
              child: Text(
                title,
                style: AppTypography.poppinsSemiBold.copyWith(
                  fontSize: 24.sp,
                  height: 0.06,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
