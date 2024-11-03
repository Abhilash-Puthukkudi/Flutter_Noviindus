part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Status loadPatientStatus;
  final List<Patient> patientList;
  const HomeState({
    this.patientList = const [],
    this.loadPatientStatus = const StatusInitial(),
  });

  @override
  List<Object> get props => [loadPatientStatus, patientList];

  HomeState copyWith({
    Status? loadPatientStatus,
    List<Patient>? patientList,
  }) {
    return HomeState(patientList: patientList ?? this.patientList, loadPatientStatus: loadPatientStatus ?? this.loadPatientStatus);
  }
}
