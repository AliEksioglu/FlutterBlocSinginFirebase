import 'package:bloc_login_deneme/authentication/authentcation.dart';
import 'package:bloc_login_deneme/login/login_cubit/login_cubit.dart';
import 'package:bloc_login_deneme/splash/splash_screans.dart';
import 'package:bloc_login_deneme/user/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  EquatableConfig.stringify = kDebugMode;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Splash()
  ));
}
