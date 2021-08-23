import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
        backgroundColor: Colors.white,
        child:
        Image.asset('lib/images/flutter_icon.png'));
  }
}
