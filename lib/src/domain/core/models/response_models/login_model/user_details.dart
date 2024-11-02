import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_details.g.dart';

@JsonSerializable()
class UserDetails extends Equatable {
  final int? id;
  @JsonKey(name: 'last_login')
  final dynamic lastLogin;
  final String? name;
  final String? phone;
  final String? address;
  final String? mail;
  final String? username;
  final String? password;
  @JsonKey(name: 'password_text')
  final String? passwordText;
  final int? admin;
  @JsonKey(name: 'is_admin')
  final bool? isAdmin;
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final dynamic branch;

  const UserDetails({
    this.id,
    this.lastLogin,
    this.name,
    this.phone,
    this.address,
    this.mail,
    this.username,
    this.password,
    this.passwordText,
    this.admin,
    this.isAdmin,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.branch,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return _$UserDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      lastLogin,
      name,
      phone,
      address,
      mail,
      username,
      password,
      passwordText,
      admin,
      isAdmin,
      isActive,
      createdAt,
      updatedAt,
      branch,
    ];
  }
}
