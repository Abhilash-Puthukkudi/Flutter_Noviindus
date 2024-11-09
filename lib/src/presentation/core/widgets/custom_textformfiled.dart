import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class CustomTextFormField extends StatefulWidget {
  final bool obscureText, readOnly;
  final TextEditingController controller;
  final String? labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final TextInputType? textInputType;
  const CustomTextFormField({
    super.key,
    this.labelText,
    required this.hintText,
    required this.controller,
    this.validator,
    this.readOnly = false,
    this.obscureText = false,
    this.suffixIcon,
    this.onTap,
    this.textInputType,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final ValueNotifier<String?> _errorNotifier = ValueNotifier<String?>(null);

  void _validate() {
    final validationMessage = widget.validator?.call(widget.controller.text);
    _errorNotifier.value = validationMessage;
  }

  bool isValid() {
    _validate();
    return _errorNotifier.value == null;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: _errorNotifier,
      builder: (context, errorText, child) {
        return SizedBox(
          width: 350.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.labelText ?? "",
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
                    color: errorText == null ? Colors.black.withOpacity(0.1) : Colors.red,
                    width: 0.85.w,
                  ),
                  borderRadius: BorderRadius.circular(8.53),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  keyboardType: widget.textInputType,
                  onTap: widget.onTap,
                  readOnly: widget.readOnly,
                  obscureText: widget.obscureText,
                  controller: widget.controller,
                  onChanged: (value) => _validate(),
                  decoration: InputDecoration(
                    suffixIconConstraints: BoxConstraints(maxHeight: 20.h, maxWidth: 20.w),
                    suffixIcon: widget.suffixIcon,
                    hintText: widget.hintText,
                    hintStyle: AppTypography.poppinsLight.copyWith(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 14.sp,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              if (errorText != null)
                Padding(
                  padding: EdgeInsets.only(left: 5.w, top: 5.h),
                  child: Text(
                    errorText,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _errorNotifier.dispose();
    super.dispose();
  }
}
