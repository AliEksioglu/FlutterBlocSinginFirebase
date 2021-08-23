import 'dart:async';
import 'dart:math';
import 'package:calisma/bariyer.dart';
import 'package:calisma/bird.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis = 0;
  static double zaman = 0;
  static double konum = 0;
  static double ilkYukseklik = birdYaxis;
  static bool gameStarted = false;
  static double barrierXone = 1.5;
  static double barrierXtwo = barrierXone + 1.5;
  static int barrierChangeSized = 180;
  static int barrierChangeSized2 = 180;
  static int skor = 0;
  static int highSkor = 0;

  void jump() {
    setState(() {
      zaman = 0;
      ilkYukseklik = birdYaxis;
    });
  }

  void startGame() {
    Random rndG = Random();
    barrierChangeSized2 = rndG.nextInt(160)+60;
    barrierChangeSized = rndG.nextInt(160)+60;
    Timer.periodic(Duration(milliseconds: 45), (timer) {
      gameStarted = true;
      zaman += 0.04;
      konum = -4.3 * zaman * zaman + 2.3 * zaman;
      setState(() {
        birdYaxis = ilkYukseklik - konum;
      });
      if (birdYaxis > 0.90724) {
        timer.cancel();
        gameOver();
      }

      if (barrierXone < -1.63)
        setState(() {
          skor++;
          barrierXone = 1.4;
          barrierChangeSized = rndG.nextInt(160)+50;
          //randomG = rndMinRange + rndG.nextInt(rndMaxRange - rndMinRange);
        });
      else
        setState(() {
          barrierXone -= 0.05;
        });

      if (barrierXtwo < -1.63)
        setState(() {
          barrierChangeSized2 = rndG.nextInt(160)+50;
          skor++;
          barrierXtwo = 1.4;
        });
      else
        setState(() {
          barrierXtwo -= 0.05;
        });
    });
  }

  void gameOver() {
    showDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.5),
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 10.0,
            backgroundColor: Colors.blue[900],
            title: Text(
              "UPSS! Çaprtın 😢" ,
            ),
            content: Text(
              "Score: $skor",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    if (skor > highSkor) highSkor = skor;
                    setState(() {
                      gameStarted = false;
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Tekrar Oyna",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30,left: 14,right: 14,bottom: 14),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),

              ),
              child: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: Stack(
                        children: [
                          GestureDetector(
                            child: AnimatedContainer(
                              alignment: Alignment(0, birdYaxis),
                              duration: Duration(milliseconds: 0),
                              color: Colors.white,
                              child: MyBird(),
                            ),
                            onTap: () {
                              gameStarted ? jump() : startGame();
                            },
                          ),
                          Container(
                            alignment: Alignment(0, -0.5),
                            child: gameStarted
                                ? Text(" ")
                                : Text(
                                    "B A Ş L A M A K   İ Ç İ N   T I K L A",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                      wordSpacing: 1.0,
                                    ),
                                  ),
                          ),
                          GestureDetector(
                            child: AnimatedContainer(
                              alignment: Alignment(barrierXone, 1.1),
                              duration: Duration(milliseconds: 0),
                              child: DuzBariyer(
                                size: barrierChangeSized.toDouble(),
                              ),
                            ),
                            onTap: () {
                              gameStarted ? jump() : startGame();
                            },
                          ),
                          GestureDetector(
                            child: AnimatedContainer(
                              alignment: Alignment(barrierXone, -1.1),
                              duration: Duration(milliseconds: 0),
                              child: TersBariyer(
                                size: 340 - barrierChangeSized.toDouble(),
                              ),
                            ),
                            onTap: () {
                              gameStarted ? jump() : startGame();
                            },
                          ),
                          GestureDetector(
                            child: AnimatedContainer(
                              alignment: Alignment(barrierXtwo, 1.1),
                              duration: Duration(milliseconds: 0),
                              child: DuzBariyer(
                                size: 340 - barrierChangeSized2.toDouble(),
                              ),
                            ),
                            onTap: () {
                              gameStarted ? jump() : startGame();
                            },
                          ),
                          GestureDetector(
                            child: AnimatedContainer(
                              alignment: Alignment(barrierXtwo, -1.1),
                              duration: Duration(milliseconds: 0),
                              child: TersBariyer(
                                size: barrierChangeSized2.toDouble(),
                              ),
                            ),
                            onTap: () {
                              gameStarted ? jump() : startGame();
                            },
                          ),
                        ],
                      )
                  ),
                  Container(
                    height: 25,
                    color: Colors.lightBlueAccent,
                  ),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            color: Colors.grey.withOpacity(0.6),
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.blueGrey,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "SKOR",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 30),
                                        Text(
                                          "$skor",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      color: Colors.black,
                                      width: 1,
                                      height: 100,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "EN İYİ SKOR",
                                          style: TextStyle(
                                            color: Colors.yellowAccent,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 30),
                                        Text(
                                          "$highSkor",
                                          style: TextStyle(
                                            color: Colors.yellowAccent,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

