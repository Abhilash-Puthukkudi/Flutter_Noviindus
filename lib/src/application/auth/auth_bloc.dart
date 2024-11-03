import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:machine_test/src/application/core/status.dart';
import 'package:machine_test/src/domain/auth/i_auth_respository.dart';
import 'package:machine_test/src/domain/core/failures/api_failure.dart';
import 'package:machine_test/src/domain/core/models/pm_models/pm_login_model/pm_login_model.dart';
import 'package:machine_test/src/domain/core/models/response_models/login_model/login_model.dart';
import 'package:machine_test/src/domain/core/pref_key/preference_key.dart';
import 'package:machine_test/src/infrastructure/core/preference_helper.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRespository _authRespository;
  AuthBloc(this._authRespository) : super(const AuthState()) {
    on<SplashEvent>(_splashEvent);
    on<LoginEvent>(_login);
    add(SplashEvent());
  }

  FutureOr<void> _splashEvent(SplashEvent event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(
        splashStatus: const StatusInitial(),
      ),
    );
    await Future.delayed(const Duration(seconds: 3));
    emit(
      state.copyWith(
        splashStatus: StatusSuccess(),
      ),
    );
  }

  FutureOr<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(
        state.copyWith(loginStatus: const StatusInitial(), loginModel: const LoginModel()),
      );

      emit(
        state.copyWith(loginStatus: StatusLoading(), loginModel: const LoginModel()),
      );

      final res = await _authRespository.login(loginModel: event.loginModel);
      if (res.status ?? false) {
        PreferenceHelper().setString(key: AppPrefeKeys.accessToken, value: res.token ?? "");
        emit(state.copyWith(
          loginStatus: StatusSuccess(),
          loginModel: res,
        ));
      } else {
        emit(state.copyWith(
          loginStatus: StatusFailure(res.message ?? ""),
        ));
      }
    } on ApiFailure catch (e) {
      emit(state.copyWith(loginStatus: StatusFailure(e.error!)));
    }
  }
}
