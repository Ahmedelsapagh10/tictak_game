import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tictac/homeScreen.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  static var blackFont = TextStyle(
      fontSize: 18,
      color: Colors.black,
      letterSpacing: 3,
      fontFamily: 'Gameplay');
  static var whiteFont = TextStyle(
      fontSize: 18,
      color: Colors.white,
      letterSpacing: 3,
      fontFamily: 'Gameplay');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(children: [
        Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'TIC TAC TOE',
                style: whiteFont,
              ),
            )),
        Expanded(
          flex: 3,
          child: AvatarGlow(
            glowColor: Colors.blue,
            endRadius: 140.0,
            duration: Duration(milliseconds: 2000),
            repeat: true,
            showTwoGlows: true,
            repeatPauseDuration: Duration(milliseconds: 100),
            child: Material(
              // Replace this child with your own
              elevation: 8.0,

              shape: CircleBorder(),
              child: CircleAvatar(
                backgroundColor: Colors.grey[100],
                child: Image.asset(
                  'images/3.png',
                  fit: BoxFit.contain,
                ),
                radius: 80.0,
              ),
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homeScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    'New Game',
                    style: blackFont,
                  ),
                ),
              ),
            ))
      ]),
    );
  }
}
