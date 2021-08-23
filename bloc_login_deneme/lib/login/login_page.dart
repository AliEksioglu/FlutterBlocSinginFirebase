import 'package:bloc_login_deneme/login/loginview.dart';
import 'package:bloc_login_deneme/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (context) => LoginCubit(context.read<AuthenticationRepository>()),
          child: LoginForm(),
        ),
      ),
    );
  }
}