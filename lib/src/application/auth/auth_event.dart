part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final PmLoginModel loginModel;

  LoginEvent({required this.loginModel});
  @override
  List<Object> get props => [loginModel];
}

class SplashEvent extends AuthEvent {
  SplashEvent();
  @override
  List<Object> get props => [];
}
