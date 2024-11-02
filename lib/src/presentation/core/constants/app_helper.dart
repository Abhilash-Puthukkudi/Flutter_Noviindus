import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
}
