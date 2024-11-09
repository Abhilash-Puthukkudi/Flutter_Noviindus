import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/app/router/router_constants.dart';
import 'package:machine_test/src/application/core/status.dart';
import 'package:machine_test/src/application/home/home_bloc.dart';
import 'package:machine_test/src/presentation/core/constants/app_colors.dart';
import 'package:machine_test/src/presentation/core/widgets/logo_loder.dart';
import 'package:machine_test/src/presentation/core/widgets/primary_button.dart';
import 'package:machine_test/src/presentation/view/home/home_screen/widgets/appbar.dart';
import 'package:machine_test/src/presentation/view/home/home_screen/widgets/empty_place_holder.dart';
import 'package:machine_test/src/presentation/view/home/home_screen/widgets/patient_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: RefreshIndicator(
        color: AppColors.primaryColor,
        backgroundColor: Colors.white,
        onRefresh: () async {
          context.read<HomeBloc>().add(LoadPatientsEvent());
        },
        child: Column(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (previous, current) =>
                  previous.loadPatientStatus != current.loadPatientStatus,
              builder: (context, state) {
                if (state.loadPatientStatus is StatusLoading) {
                  return const Expanded(child: Center(child: LogoLoder()));
                } else if (state.loadPatientStatus is StatusSuccess) {
                  if (state.patientList.isEmpty) {
                    return const EmptyPlaceHolder();
                  }
                  return Expanded(
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: state.patientList.length,
                      itemBuilder: (context, index) {
                        return PatientTile(
                          patientNo: (index + 1).toString(),
                          patient: state.patientList[index],
                        );
                      },
                    ),
                  );
                }
                return const EmptyPlaceHolder();
              },
            ),
            SizedBox(
              width: 350.w,
              height: 50.h,
              child: PrimaryButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouterConstants.registerRoute);
                },
                text: "Register Now",
              ),
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
