import 'package:blocs_provaider_list_consumer/bloc/bloc_cats_wiev.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Selam",
      home: BlocsCatView(),
    );
  }
}

