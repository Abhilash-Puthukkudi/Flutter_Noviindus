import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class RegisterDropDown extends StatefulWidget {
  final String labelText;
  final String hintText;
  final List<String> items;
  final void Function(String?)? onChanged;
  final ValueNotifier<String?> selectedItemNotifier;

  const RegisterDropDown({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.items,
    required this.selectedItemNotifier,
    this.onChanged,
  });

  @override
  State<RegisterDropDown> createState() => _RegisterDropDownState();
}

class _RegisterDropDownState extends State<RegisterDropDown> {
  @override
  void initState() {
    super.initState();
    // Ensure the initial value of the notifier is valid
    if (!widget.items.contains(widget.selectedItemNotifier.value)) {
      widget.selectedItemNotifier.value = null; // or set to a valid item
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: AppTypography.poppinsRegular.copyWith(
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.textFiledColor,
              border: Border.all(
                color: Colors.black.withOpacity(0.1),
                width: 0.85.w,
              ),
              borderRadius: BorderRadius.circular(8.53),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ValueListenableBuilder<String?>(
              valueListenable: widget.selectedItemNotifier,
              builder: (context, selectedItem, child) {
                return DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    elevation: 1,
                    menuWidth: 300.w,
                    value: selectedItem, // This should match an item in items
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(9.w),
                    hint: Text(
                      widget.hintText,
                      style: AppTypography.poppinsRegular.copyWith(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 14.sp,
                      ),
                    ),
                    isExpanded: true,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.secondaryColor,
                    ),
                    items: widget.items
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: AppTypography.poppinsRegular.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      widget.selectedItemNotifier.value =
                          newValue; // Update the notifier
                      if (widget.onChanged != null) {
                        widget.onChanged!(newValue);
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
