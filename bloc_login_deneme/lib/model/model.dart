import 'package:formz/formz.dart';

enum EmailValidationError { invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError validator(String value) {
    return _emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}

enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {

  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegExp =
  RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError validator(String value) {
    return _passwordRegExp.hasMatch(value)
        ? null
        : PasswordValidationError.invalid;
  }
}

enum ConfirmedPasswordValidationError { invalid }

class ConfirmedPassword extends FormzInput<String, ConfirmedPasswordValidationError> {
  final password;
  final currentpassword;
  const ConfirmedPassword.pure({this.currentpassword, this.password}) : super.pure('');
  const ConfirmedPassword.dirty(this.currentpassword, this.password) : super.dirty(currentpassword);

  static final _passwordRegExp =
  RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  ConfirmedPasswordValidationError validator(value) {
    return password == currentpassword
        ? null
        : ConfirmedPasswordValidationError.invalid;
  }
}

