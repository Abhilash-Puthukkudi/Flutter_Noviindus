// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientListModel _$PatientListModelFromJson(Map<String, dynamic> json) =>
    PatientListModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      patient: (json['patient'] as List<dynamic>?)
          ?.map((e) => Patient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PatientListModelToJson(PatientListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'patient': instance.patient,
    };
