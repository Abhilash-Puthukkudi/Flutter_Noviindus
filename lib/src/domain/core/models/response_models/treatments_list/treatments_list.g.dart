// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treatments_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreatmentsList _$TreatmentsListFromJson(Map<String, dynamic> json) =>
    TreatmentsList(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      treatments: (json['treatments'] as List<dynamic>?)
          ?.map((e) => Treatment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TreatmentsListToJson(TreatmentsList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'treatments': instance.treatments,
    };
