import 'package:bloc_login_deneme/login/login_page.dart';
import 'package:bloc_login_deneme/splash/splash_screans.dart';
import 'package:bloc_login_deneme/user/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../homepage.dart';
import 'authenticationbloc/authentication_bloc.dart';

class Authentication extends StatelessWidget {
  const Authentication ({
    Key key,
    @required this.authenticationRepository,
  })  : assert(authenticationRepository != null),
        super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (context) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
        ),
        child: MaterialApp(home: AuthenticationView()),
      ),
    );
  }
}

class AuthenticationView extends StatefulWidget {
  @override
  AuthenticationViewState createState() => AuthenticationViewState();
}

class AuthenticationViewState extends State<AuthenticationView> {



  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
            child: Center(),
            listener: (context, state) {
              switch (state.status) {
                case AuthenticationStatus.authenticated:
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => HomePage()));
                  break;
                case AuthenticationStatus.unauthenticated:
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => LoginPage()));
                  break;
                default:
                  break;
              }

            },

          );
        }
  }
