import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:machine_test/app/router/router_constants.dart';
import 'package:machine_test/src/application/auth/auth_bloc.dart';
import 'package:machine_test/src/application/core/status.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_helper.dart';
import 'package:machine_test/src/presentation/core/constants/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppHelper.precacheImages(context: context, imgPaths: [
      AppImages.loginBackground,
    ]);
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          previous.splashStatus != current.splashStatus,
      listener: (context, state) {
        if (state.splashStatus is StatusSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouterConstants.loginRoute,
            (route) => false,
          );
        }
      },
      child: Scaffold(
          body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.splashBackground),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              AppColors.splashFilterColor,
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 134.w,
            height: 142.h,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: Svg(AppImages.splashLogo)),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
