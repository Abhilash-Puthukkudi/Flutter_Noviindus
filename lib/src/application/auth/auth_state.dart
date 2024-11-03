part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final Status loginStatus, logoutStatus, splashStatus;
  final LoginModel loginModel;

  const AuthState({
    this.splashStatus = const StatusInitial(),
    this.logoutStatus = const StatusInitial(),
    this.loginModel = const LoginModel(),
    this.loginStatus = const StatusInitial(),
  });

  @override
  List<Object> get props => [
        loginStatus,
        // loginModel,
        logoutStatus,
        splashStatus,
      ];

  AuthState copyWith(
      {Status? loginStatus,
      Status? logoutStatus,
      LoginModel? loginModel,
      Status? splashStatus,
      Status? splashImgStatus}) {
    return AuthState(
      splashStatus: splashStatus ?? this.splashStatus,
      logoutStatus: logoutStatus ?? this.logoutStatus,
      loginStatus: loginStatus ?? this.loginStatus,
      loginModel: loginModel ?? this.loginModel,
    );
  }
}
