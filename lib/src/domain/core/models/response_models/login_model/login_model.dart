import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user_details.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends Equatable {
  final bool? status;
  final String? message;
  final String? token;
  @JsonKey(name: 'is_superuser')
  final bool? isSuperuser;
  @JsonKey(name: 'user_details')
  final UserDetails? userDetails;

  const LoginModel({
    this.status,
    this.message,
    this.token,
    this.isSuperuser,
    this.userDetails,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return _$LoginModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  @override
  List<Object?> get props {
    return [
      status,
      message,
      token,
      isSuperuser,
      userDetails,
    ];
  }
}
