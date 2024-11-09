import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class CustomDropdownButton extends StatelessWidget {
  final List<String> items;
  final String hint;
  final ValueChanged<String?> onChanged;
  final String? selectedValue;

  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.hint,
    required this.onChanged,
    this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 169,
      height: 39,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(33.r),
        ),
      ),
      child: DropdownButton<String>(
        menuWidth: 140.w,
        style: AppTypography.poppinsRegular,
        borderRadius: BorderRadius.circular(15.r),
        isExpanded: true,
        dropdownColor: AppColors.white,
        elevation: 1,
        underline: const SizedBox.shrink(),
        icon: const Icon(Icons.keyboard_arrow_down,
            color: AppColors.primaryColor),
        hint: Text(
          hint,
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontSize: 14,
          ),
        ),
        value: selectedValue,
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: AppTypography.poppinsRegular.copyWith(fontSize: 13.sp),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
