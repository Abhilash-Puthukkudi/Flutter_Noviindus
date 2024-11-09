import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:machine_test/src/application/core/status.dart';
import 'package:machine_test/src/domain/core/failures/api_failure.dart';
import 'package:machine_test/src/domain/core/models/response_models/patient_list_model/patient.dart';
import 'package:machine_test/src/domain/home/i_home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeRepository _iHomeRepository;
  HomeBloc(this._iHomeRepository) : super(const HomeState()) {
    on<LoadPatientsEvent>(_loadPatientList);
  }

  FutureOr<void> _loadPatientList(
      LoadPatientsEvent event, Emitter<HomeState> emit) async {
    try {
      emit(
        state.copyWith(
            loadPatientStatus: const StatusInitial(), patientList: []),
      );

      emit(
        state.copyWith(
          loadPatientStatus: StatusLoading(),
        ),
      );

      final res = await _iHomeRepository.getPatientList();

      if (res.status ?? false) {
        emit(
          state.copyWith(
              loadPatientStatus: StatusSuccess(), patientList: res.patient),
        );
      } else {
        emit(state.copyWith(
            loadPatientStatus:
                StatusFailure(res.message ?? "Something Went Wrong!"),
            patientList: []));
      }
    } on ApiFailure catch (e) {
      emit(state.copyWith(loadPatientStatus: StatusFailure(e.error!)));
    }
  }
}
