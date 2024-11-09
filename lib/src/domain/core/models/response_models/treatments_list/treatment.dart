import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'treatment.g.dart';

@JsonSerializable()
class Treatment extends Equatable {
  final int? id;
  final List<dynamic>? branches;
  final String? name;
  final String? duration;
  final String? price;
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const Treatment({
    this.id,
    this.branches,
    this.name,
    this.duration,
    this.price,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory Treatment.fromJson(Map<String, dynamic> json) {
    return _$TreatmentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TreatmentToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      branches,
      name,
      duration,
      price,
      isActive,
      createdAt,
      updatedAt,
    ];
  }
}
