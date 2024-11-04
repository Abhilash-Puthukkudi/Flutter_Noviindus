import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/domain/core/models/response_models/patient_list_model/patient.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class PatientTile extends StatelessWidget {
  final Patient patient;
  final String patientNo;

  const PatientTile({
    super.key,
    required this.patient,
    required this.patientNo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w).copyWith(top: 14.h, bottom: 9.h),
      width: 350.w,
      // height: 1.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w).copyWith(top: 15.w),
            child: _buildTitleRow(patientNo, patient.name ?? "n/a"),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 12.w),
            child: _buildText(
              patient.patientdetailsSet?.map((details) => details.treatmentName).join(', ') ?? '',
              color: const Color(0xFF006837),
              fontSize: 16.sp,
              fontWeight: FontWeight.w300,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: _buildIconText(
                    icon: Icons.calendar_today,
                    text: '31/01/2024',
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                // SizedBox(width: 10.w),
                Flexible(
                  child: _buildIconText(
                    icon: Icons.person,
                    text: 'Jithesh asdasdasdassdsdsdss',
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Divider(
            color: Colors.black.withOpacity(0.2),
            thickness: 1.h,
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 12.w, bottom: 10.w),
            child: InkWell(
              splashFactory: InkRipple.splashFactory,
              splashColor: AppColors.primaryColor,
              highlightColor: AppColors.black,
              onTap: () {
                log("tapped here");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildText(
                    'View Booking details',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: AppColors.primaryColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleRow(String number, String name) {
    return Row(
      children: [
        _buildText(number, fontSize: 18.sp, fontWeight: FontWeight.w500),
        SizedBox(width: 10.w),
        Expanded(
          child: _buildText(
            name,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildIconText({required IconData icon, required String text, Color? color}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 16.sp, color: const Color(0xFFF24E1E)),
        SizedBox(width: 5.w),
        Expanded(
          child: _buildText(
            text,
            color: color,
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildText(
    String text, {
    Color? color,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    TextOverflow overflow = TextOverflow.clip,
  }) {
    return Text(
      text,
      style: AppTypography.poppinsRegular.copyWith(
        color: color ?? Colors.black,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        height: 1.0.h,
      ),
      overflow: overflow,
      maxLines: 1,
    );
  }
}
