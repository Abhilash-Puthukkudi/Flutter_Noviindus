// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branches_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchesModel _$BranchesModelFromJson(Map<String, dynamic> json) =>
    BranchesModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      branches: (json['branches'] as List<dynamic>?)
          ?.map((e) => Branch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BranchesModelToJson(BranchesModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'branches': instance.branches,
    };
