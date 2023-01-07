import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tictac/home.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  Color PlayerColor1 = Color.fromRGBO(75, 174, 255, 1);
  Color PlayerColor2 = Colors.white;
//font
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

  //
  List<String> cellValue = ['', '', '', '', '', '', '', '', ''];
  bool checkState = true; // o
  int Oresult = 0;
  int Xresult = 0;
  int filledBoxes = 0;

  TextStyle myTextstyle = const TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
            flex: 2,
            child: Container(
              //  color: Colors.red,
              alignment: Alignment.center,
              height: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Player O',
                        style: TextStyle(
                            fontSize: 18,
                            color: PlayerColor1,
                            letterSpacing: 3,
                            fontFamily: 'Gameplay'),
                      ),
                      Text(
                        Oresult.toString(),
                        style: whiteFont,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Player X',
                        style: TextStyle(
                            fontSize: 18,
                            color: PlayerColor2,
                            letterSpacing: 3,
                            fontFamily: 'Gameplay'),
                      ),
                      Text(
                        Xresult.toString(),
                        style: whiteFont,
                      ),
                    ],
                  )
                ],
              ),
            )),
        Expanded(
          flex: 4,
          child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => onTap(index),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Color.fromARGB(255, 189, 255, 252),
                      width: 0.5,
                    )),
                    child: Center(
                      child:
                          Text(cellValue[index].toString(), style: whiteFont),
                    ),
                  ),
                );
              }),
        ),
        Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'TIC TAC TOE',
                style: whiteFont,
              ),
            )),
      ]),
    );
  }

  void onTap(int index) {
    setState(() {
      if (checkState && cellValue[index] == '') {
        PlayerColor2 = Color.fromARGB(255, 64, 169, 255);
        PlayerColor1 = Color.fromARGB(255, 255, 255, 255);
        cellValue[index] = 'O';
        filledBoxes++;
      } else if (!checkState && cellValue[index] == '') {
        cellValue[index] = 'X';
        PlayerColor1 = Color.fromARGB(255, 64, 169, 255);
        PlayerColor2 = Color.fromARGB(255, 255, 255, 255);

        filledBoxes++;
      }
      checkState = !checkState;
      winerCheck();
    });
  }

  void winerCheck() {
    if (cellValue[0] == cellValue[1] &&
        cellValue[1] == cellValue[2] &&
        cellValue[0] != '') {
      _showDialog(cellValue[0]);
    }
    if (cellValue[3] == cellValue[4] &&
        cellValue[4] == cellValue[5] &&
        cellValue[3] != '') {
      _showDialog(cellValue[3]);
    }
    if (cellValue[6] == cellValue[7] &&
        cellValue[7] == cellValue[8] &&
        cellValue[6] != '') {
      _showDialog(cellValue[6]);
    }
    if (cellValue[0] == cellValue[4] &&
        cellValue[4] == cellValue[8] &&
        cellValue[0] != '') {
      _showDialog(cellValue[0]);
    }
    if (cellValue[2] == cellValue[4] &&
        cellValue[4] == cellValue[6] &&
        cellValue[2] != '') {
      _showDialog(cellValue[2]);
    }
    if (cellValue[0] == cellValue[3] &&
        cellValue[3] == cellValue[6] &&
        cellValue[0] != '') {
      _showDialog(cellValue[0]);
    }
    if (cellValue[1] == cellValue[4] &&
        cellValue[4] == cellValue[7] &&
        cellValue[1] != '') {
      _showDialog(cellValue[1]);
    }
    if (cellValue[2] == cellValue[5] &&
        cellValue[5] == cellValue[8] &&
        cellValue[2] != '') {
      _showDialog(cellValue[2]);
    } else if (filledBoxes == 9) {
      _showsecondDialog();
    }
  }

  void _showDialog(String winer) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('THE WINNER IS : $winer', style: blackFont),
            backgroundColor: Colors.white,
            alignment: Alignment.center,
            elevation: 5,
            actionsAlignment: MainAxisAlignment.spaceAround,
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    RestApp();
                    Navigator.of(context).pop();
                  });
                },
                child: Icon(
                  Icons.replay,
                  color: Colors.green,
                  size: 22,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => home()));
                  });
                },
                child: Icon(
                  Icons.home,
                  color: Colors.red,
                  size: 22,
                ),
              ),
            ],
          );
        });
    WinerAdd(winer);
  }

  WinerAdd(String winer) {
    setState(() {
      if (winer == 'O') {
        Oresult++;
      } else if (winer == 'X') {
        Xresult++;
      }
    });
  }

  RestApp() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        cellValue[i] = '';
      }
      filledBoxes = 0;
    });
  }

  void _showsecondDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'loss',
              style: blackFont,
            ),
            backgroundColor: Colors.white,
            actionsAlignment: MainAxisAlignment.spaceAround,
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    RestApp();
                    Navigator.of(context).pop();
                  });
                },
                child: Icon(
                  Icons.replay,
                  color: Colors.green,
                  size: 22,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => home()));
                  });
                },
                child: Icon(
                  Icons.home,
                  color: Colors.red,
                  size: 22,
                ),
              ),
            ],
          );
        });
  }
}
