import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class RadioButtonWidget extends StatelessWidget {
  final String labelText;
  final List<String> options;
  final ValueNotifier<String?> selectedValueNotifier;

  RadioButtonWidget(
      {super.key,
      required this.options,
      required this.labelText,
      required this.selectedValueNotifier});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: AppTypography.poppinsRegular.copyWith(
            fontSize: 16.sp,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Padding(
          padding: EdgeInsets.only(right: 18.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: options.map((option) {
              return ValueListenableBuilder<String?>(
                valueListenable: selectedValueNotifier,
                builder: (context, value, child) {
                  return Row(
                    children: [
                      Radio<String?>(
                        activeColor: AppColors.primaryColor,
                        value: option,
                        groupValue: value,
                        onChanged: (newValue) {
                          if (newValue != null) {
                            selectedValueNotifier.value = newValue;
                          }
                        },
                      ),
                      Text(
                        option,
                        style: AppTypography.poppinsRegular.copyWith(
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
