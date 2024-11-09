import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';

import 'package:machine_test/src/presentation/core/constants/app_images.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

import 'package:machine_test/src/presentation/core/widgets/primary_button.dart';
import 'package:machine_test/src/presentation/view/home/home_screen/widgets/custom_filer_dropdown.dart';
import 'package:machine_test/src/presentation/view/home/home_screen/widgets/search_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(248.0.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 243.h,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.borderColor)),
        color: Colors.white,
      ),
      child: SafeArea(
        child: Column(
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
                    icon: Badge(
                        alignment: const Alignment(0.65, -0.6),
                        child: Image.asset(
                            height: 28.h, width: 28.w, AppImages.bellIcon)),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Search field
                      Expanded(
                          child: CustomSearchBar(
                        controller: TextEditingController(),
                        hintText: "Search for treatments",
                      )),
                      SizedBox(width: 10.0.w),
                      // Button
                      SizedBox(
                          width: 85.44.w,
                          height: 40.h,
                          child: PrimaryButton(
                            text: "Search",
                            onPressed: () {},
                            fontsize: 12.sp,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sort by :',
                        style: AppTypography.poppinsRegular.copyWith(
                          color: AppColors.headingColor,
                          fontSize: 14.sp,
                        ),
                      ),
                      CustomDropdownButton(
                        items: const ["Date", "A-Z", "Z-A"],
                        onChanged: (value) {},
                        selectedValue: "Date",
                        hint: "",
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
