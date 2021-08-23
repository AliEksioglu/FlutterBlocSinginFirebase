import 'package:flutter/material.dart';

class LoginArayuz extends StatefulWidget {
  @override
  _LoginArayuzState createState() => _LoginArayuzState();
}

class _LoginArayuzState extends State<LoginArayuz> {

  TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flappy Bird"),
        elevation: 10.0,
        shadowColor: Colors.red,
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
          ),
        ],
      ),
    );
  }
}
