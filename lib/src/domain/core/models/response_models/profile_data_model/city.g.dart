// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      createdDate: json['created_date'] as String?,
      createdTime: json['created_time'] as String?,
      flag: json['flag'] as bool?,
      state: (json['state'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_date': instance.createdDate,
      'created_time': instance.createdTime,
      'flag': instance.flag,
      'state': instance.state,
    };