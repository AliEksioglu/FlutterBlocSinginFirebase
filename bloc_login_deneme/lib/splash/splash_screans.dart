import 'dart:async';
import 'package:bloc_login_deneme/authentication/authentcation.dart';
import 'package:bloc_login_deneme/user/user_repository.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<Splash> with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;
  

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }



  void navigationPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Authentication(authenticationRepository: AuthenticationRepository())));
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 1));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/pati.jpg',
                      width: 20,
                      height: 20,
                    ),
                    Text("   Z T D E N E M E"
                    ,style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/pati.jpg',
                width: animation.value * 200,
                height: animation.value * 200,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
