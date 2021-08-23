part of 'login_cubit.dart';

class LoginState extends Equatable {
  LoginState({
    this.password= const Password.pure(),
    this.email = const Email.pure(),
    this.status= FormzStatus.pure,
  });

  final Email email;
  final Password password;
  final FormzStatus status;

  LoginState copyWith({
    Email email,
    Password password,
    FormzStatus status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, status];

}
