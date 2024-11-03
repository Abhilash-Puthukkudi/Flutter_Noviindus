import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'branch.dart';
import 'patientdetails_set.dart';

part 'patient.g.dart';

@JsonSerializable()
class Patient extends Equatable {
  final int? id;
  @JsonKey(name: 'patientdetails_set')
  final List<PatientdetailsSet>? patientdetailsSet;
  final Branch? branch;
  final String? user;
  final String? payment;
  final String? name;
  final String? phone;
  final String? address;
  final dynamic price;
  @JsonKey(name: 'total_amount')
  final int? totalAmount;
  @JsonKey(name: 'discount_amount')
  final int? discountAmount;
  @JsonKey(name: 'advance_amount')
  final int? advanceAmount;
  @JsonKey(name: 'balance_amount')
  final int? balanceAmount;
  @JsonKey(name: 'date_nd_time')
  final dynamic dateNdTime;
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const Patient({
    this.id,
    this.patientdetailsSet,
    this.branch,
    this.user,
    this.payment,
    this.name,
    this.phone,
    this.address,
    this.price,
    this.totalAmount,
    this.discountAmount,
    this.advanceAmount,
    this.balanceAmount,
    this.dateNdTime,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return _$PatientFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      patientdetailsSet,
      branch,
      user,
      payment,
      name,
      phone,
      address,
      price,
      totalAmount,
      discountAmount,
      advanceAmount,
      balanceAmount,
      dateNdTime,
      isActive,
      createdAt,
      updatedAt,
    ];
  }
}
