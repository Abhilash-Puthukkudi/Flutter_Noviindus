import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patientdetails_set.g.dart';

@JsonSerializable()
class PatientdetailsSet extends Equatable {
  final int? id;
  final String? male;
  final String? female;
  final int? patient;
  final int? treatment;
  @JsonKey(name: 'treatment_name')
  final String? treatmentName;

  const PatientdetailsSet({
    this.id,
    this.male,
    this.female,
    this.patient,
    this.treatment,
    this.treatmentName,
  });

  factory PatientdetailsSet.fromJson(Map<String, dynamic> json) {
    return _$PatientdetailsSetFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientdetailsSetToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      male,
      female,
      patient,
      treatment,
      treatmentName,
    ];
  }
}
