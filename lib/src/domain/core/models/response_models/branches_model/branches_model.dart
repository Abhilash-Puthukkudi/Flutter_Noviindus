import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'branch.dart';

part 'branches_model.g.dart';

@JsonSerializable()
class BranchesModel extends Equatable {
  final bool? status;
  final String? message;
  final List<Branch>? branches;

  const BranchesModel({this.status, this.message, this.branches});

  factory BranchesModel.fromJson(Map<String, dynamic> json) {
    return _$BranchesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BranchesModelToJson(this);

  @override
  List<Object?> get props => [status, message, branches];
}
