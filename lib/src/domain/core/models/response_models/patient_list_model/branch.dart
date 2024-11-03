import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'branch.g.dart';

@JsonSerializable()
class Branch extends Equatable {
  final int? id;
  final String? name;
  @JsonKey(name: 'patients_count')
  final int? patientsCount;
  final String? location;
  final String? phone;
  final String? mail;
  final String? address;
  final String? gst;
  @JsonKey(name: 'is_active')
  final bool? isActive;

  const Branch({
    this.id,
    this.name,
    this.patientsCount,
    this.location,
    this.phone,
    this.mail,
    this.address,
    this.gst,
    this.isActive,
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return _$BranchFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BranchToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      name,
      patientsCount,
      location,
      phone,
      mail,
      address,
      gst,
      isActive,
    ];
  }
}
