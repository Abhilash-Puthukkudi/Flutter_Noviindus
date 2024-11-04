import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:machine_test/app/injector/injector.dart';
import 'package:machine_test/app/router/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/src/application/auth/auth_bloc.dart';
import 'package:machine_test/src/application/home/home_bloc.dart';

import 'package:machine_test/src/presentation/core/constants/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light, statusBarColor: Colors.black));
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => getIt<AuthBloc>()),
            BlocProvider(create: (context) => getIt<HomeBloc>()),
          ],
          child: MaterialApp(
            builder: (BuildContext context, Widget? child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: const TextScaler.linear(1),
                ),
                child: child!,
              );
            },
            theme: ThemeData(
              textSelectionTheme: const TextSelectionThemeData(cursorColor: AppColors.primaryColor),
              primaryColor: AppColors.primaryColor,
              appBarTheme: const AppBarTheme(color: AppColors.scaffoldColor),
              useMaterial3: true,
              scaffoldBackgroundColor: AppColors.white,
            ),
            onGenerateRoute: AppRouter.generateRoute,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
