import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:machine_test/app/router/router_constants.dart';
import 'package:machine_test/src/application/auth/auth_bloc.dart';
import 'package:machine_test/src/application/core/status.dart';
import 'package:machine_test/src/domain/core/models/pm_models/pm_login_model/pm_login_model.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/constants/app_helper.dart';
import 'package:machine_test/src/presentation/core/constants/app_images.dart';
import 'package:machine_test/src/presentation/core/constants/app_typography.dart';
import 'package:machine_test/src/presentation/core/widgets/custom_textformfiled.dart';
import 'package:machine_test/src/presentation/core/widgets/loader_widget.dart';
import 'package:machine_test/src/presentation/core/widgets/primary_button.dart';
import 'package:machine_test/src/presentation/view/auth/widgets/privacy_policy.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: "test_user");
  final _passwordController = TextEditingController(text: "12345678");
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous.loginStatus != current.loginStatus,
      listener: (context, state) {
        if (state.loginStatus is StatusSuccess) {
          Navigator.pushNamed(context, RouterConstants.homeRoute);
        } else if (state.loginStatus is StatusFailure) {
          final status = state.loginStatus as StatusFailure;
          AppHelper.showCustomSnackBar(context, status.errorMessage, AppColors.errorColor);
        }
      },
      child: Scaffold(
        body: SizedBox(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 254.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.loginBackground),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 80.w,
                      height: 84.h,
                      child: const Image(
                        image: Svg(AppImages.splashLogo),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w).copyWith(top: 30.h),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          child: Text(
                            'Login Or Register To Book Your Appointments',
                            style: AppTypography.poppinsSemiBold.copyWith(
                              fontSize: 24.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        CustomTextFormField(
                          controller: _emailController,
                          hintText: "Enter your email",
                          labelText: "Email",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field cannot be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        CustomTextFormField(
                          obscureText: true,
                          controller: _passwordController,
                          hintText: "Enter your Password",
                          labelText: "Password",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field cannot be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 84.h,
                        ),
                        BlocBuilder<AuthBloc, AuthState>(
                          buildWhen: (previous, current) => previous.loginStatus != current.loginStatus,
                          builder: (context, state) {
                            return SizedBox(
                              width: 350.w,
                              height: 50.h,
                              child: PrimaryButton(
                                onPressed: () {
                                  if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                                    context.read<AuthBloc>().add(LoginEvent(loginModel: PmLoginModel(password: _passwordController.text, username: _emailController.text)));
                                  } else {
                                    AppHelper.showCustomSnackBar(context, "Please Enter Username and Password", AppColors.errorColor);
                                  }
                                },
                                text: "Login",
                                child: state.loginStatus is StatusLoading ? const Loader() : null,
                              ),
                            );
                          },
                        ),
                        const PrivacyPolicy()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
