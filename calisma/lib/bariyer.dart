import 'package:flutter/material.dart';

class DuzBariyer extends StatelessWidget {
  const DuzBariyer({Key key, this.size}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0,-1),
      children: [
        Container(
          width: 60,
          height: size,
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            border: Border.all(
              width: 4.0,
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(7.0),
          ),
        ),
        Container(
          width: 80,
          height: 30,
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              border: Border.all(
                width: 4.0,
                color: Colors.blue,
              )
          ),
        ),
        Container(
          color: Colors.pink,
          height: 5,
          width: 15,
          alignment: Alignment(0,1),
        ),
      ],
    );
  }
}
class TersBariyer extends StatelessWidget {
  const TersBariyer({Key key, this.size}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(0,1),
      children: [
        Container(
          width: 60,
          height: size,
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            border: Border.all(
              width: 4.0,
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(7.0),
          ),
        ),
        Container(
          width: 80,
          height: 30,
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              border: Border.all(
                width: 4.0,
                color: Colors.blue,
              )
          ),
        ),
        Container(
          color: Colors.pink,
          height: 5,
          width: 15,
          alignment: Alignment(0,1),
        ),
      ],
    );
  }
}
class RegisterScrean extends StatefulWidget {
  @override
  _RegisterScreanState createState() => _RegisterScreanState();
}

class _RegisterScreanState extends State<RegisterScrean> {

  final TextEditingController _username = TextEditingController();
  final TextEditingController _pasword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Kayıt Ol"),
          elevation: 10,
          backgroundColor: Colors.pink,
        ),
        body: Form(
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}