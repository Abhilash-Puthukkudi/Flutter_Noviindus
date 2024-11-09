import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'treatment.dart';

part 'treatments_list.g.dart';

@JsonSerializable()
class TreatmentsList extends Equatable {
  final bool? status;
  final String? message;
  final List<Treatment>? treatments;

  const TreatmentsList({this.status, this.message, this.treatments});

  factory TreatmentsList.fromJson(Map<String, dynamic> json) {
    return _$TreatmentsListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TreatmentsListToJson(this);

  @override
  List<Object?> get props => [status, message, treatments];
}
