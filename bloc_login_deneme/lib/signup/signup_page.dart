

import 'package:bloc_login_deneme/signup/signupview.dart';
import 'package:bloc_login_deneme/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup_cubit/signup_cubit.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider<SignUpCubit>(
          create: (_) => SignUpCubit(context.read<AuthenticationRepository>()),
          child: SignUpForm(),
        ),
      ),
    );
  }
}