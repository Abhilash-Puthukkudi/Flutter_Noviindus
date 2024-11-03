import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'patient.dart';

part 'patient_list_model.g.dart';

@JsonSerializable()
class PatientListModel extends Equatable {
  final bool? status;
  final String? message;
  final List<Patient>? patient;

  const PatientListModel({this.status, this.message, this.patient});

  factory PatientListModel.fromJson(Map<String, dynamic> json) {
    return _$PatientListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientListModelToJson(this);

  @override
  List<Object?> get props => [status, message, patient];
}
