import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_images.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class TreatmentsListWidget extends StatelessWidget {
  final List<String> treatmentList;
  const TreatmentsListWidget({
    super.key,
    required this.treatmentList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Treatments",
          style: AppTypography.poppinsRegular.copyWith(
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 5.h),
        Container(
          padding:
              EdgeInsets.only(left: 20.w, top: 5.h, bottom: 14.h, right: 3.w),
          width: 350.w,
          // height: 84.h,
          decoration: ShapeDecoration(
            color: const Color(0xFFF0F0F0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.53),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text("Couple Combo package sdsdsdsdsdi..",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.poppinsMedium.copyWith(
                              fontSize: 18.sp, color: AppColors.black))),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        AppImages.closeIcon,
                        width: 28.w,
                        height: 28.h,
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 25.w,
                      ),
                      buildCountWidget(count: "0", title: "Male"),
                      SizedBox(
                        width: 35.w,
                      ),
                      buildCountWidget(count: "0", title: "Female"),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        AppImages.editIcon,
                        width: 18.w,
                        height: 18.h,
                      ))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Row buildCountWidget({required String title, required String count}) {
    return Row(
      children: [
        Text(
          title,
          style: AppTypography.poppinsRegular
              .copyWith(fontSize: 16.sp, color: AppColors.primaryColor),
        ),
        SizedBox(
          width: 9.w,
        ),
        Container(
          width: 44.w,
          height: 26.h,
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.black.withOpacity(0.3),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Text(
            count,
            style: AppTypography.poppinsRegular
                .copyWith(fontSize: 16.sp, color: AppColors.primaryColor),
          ),
        )
      ],
    );
  }
}
