import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_images.dart';

class LogoLoder extends StatelessWidget {
  final double progressSize;
  final double logoSize;
  const LogoLoder({
    super.key,
    this.progressSize = 85.0,
    this.logoSize = 79.0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: progressSize.w,
          height: progressSize.h,
          child: CircularProgressIndicator(
            backgroundColor: AppColors.white,
            color: AppColors.primaryColor,
            strokeWidth: 1.0.w,
          ),
        ),
        Image(
          image: const Svg(AppImages.splashLogo),
          width: logoSize.w,
          height: logoSize.h,
        ),
      ],
    );
  }
}
