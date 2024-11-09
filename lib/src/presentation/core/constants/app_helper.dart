import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';

class AppHelper {
  static Future<void> precacheImages(
      {required List<String> imgPaths, required BuildContext context}) async {
    for (String image in imgPaths) {
      await precacheImage(AssetImage(image), context);
    }
  }

  static void showCustomSnackBar(
      BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 1),
      showCloseIcon: true,
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      content: Center(
        child: Text(
          message,
          style: AppTypography.poppinsRegular.copyWith(
            color: Colors.white,
            fontSize: 14.sp,
          ),
        ),
      ),
    ));
  }

  static Future<String?> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryColor,
            colorScheme:
                const ColorScheme.light(primary: AppColors.primaryColor),
          ),
          child: child ?? Container(),
        );
      },
    );

    if (pickedTime != null) {
      final DateTime now = DateTime.now();
      final DateTime selectedDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      String formattedTime = DateFormat('HH:mm').format(selectedDateTime);
      return formattedTime;
    }
    return null;
  }

  static Future<String?> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryColor,
            colorScheme:
                const ColorScheme.light(primary: AppColors.primaryColor),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child ?? Container(),
        );
      },
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      return formattedDate;
    }
    return null;
  }
}
