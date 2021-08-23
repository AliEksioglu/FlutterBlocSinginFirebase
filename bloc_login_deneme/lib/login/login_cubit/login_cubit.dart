import 'package:bloc/bloc.dart';
import 'package:bloc_login_deneme/model/model.dart';
import 'package:bloc_login_deneme/user/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository _authenticationRepository;


  LoginCubit(this._authenticationRepository)
      : assert(_authenticationRepository != null),
        super(LoginState());



  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.email]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.password, password]),
    ));
  }

  Future<void> logInWithCredentials() async {
    if (!state.status.isValidated)
    return emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.logInWithGoogle();
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    } on NoSuchMethodError {
      emit(state.copyWith(status: FormzStatus.pure));
    }
  }

}