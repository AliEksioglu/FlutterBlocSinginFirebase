import 'package:bloc_login_deneme/model/model.dart';
import 'package:bloc_login_deneme/signup/signup_cubit/signup_state.dart';
import 'package:bloc_login_deneme/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';



class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authenticationRepository)
      : assert(_authenticationRepository != null),
        super(const SignUpState());

  final AuthenticationRepository _authenticationRepository;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([
        email,
        state.password,
        state.confirmedPassword
      ]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    final confirmedPassword = ConfirmedPassword.dirty(value, state.password.value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([
        state.email,
        password,
        state.confirmedPassword,
      ]),
    ));
  }

  void confirmedPasswordChanged(String value) {
    final confirmedPassword = ConfirmedPassword.dirty(value, state.password.value);
    emit(state.copyWith(
      confirmedPassword: confirmedPassword,
      status: Formz.validate([
        state.email,
        state.password,
        confirmedPassword
      ]),
    ));
  }


  Future<void> signUpFormSubmitted() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _authenticationRepository.signUp(
        email: state.email.value,
        password: state.password.value,

      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}