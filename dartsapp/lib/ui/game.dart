import 'dart:ui';

import 'package:dartsapp/constants/routes.dart';
import 'package:dartsapp/util/dart_checkouts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<String>? _args;
  late String _player1;
  late String _player2;
  late int _maxLegs;
  late int _maxSets;
  int _p1Legs = 0;
  int _p2Legs = 0;
  int _p1Sets = 0;
  int _p2Sets = 0;
  int _p1Points = 501;
  int _p2Points = 501;
  late final TextEditingController _score;
  int? _turn = 1;
  bool _p1Win = false;
  bool _p2Win = false;
  List<String> checkouts = ["", "", "", ""];

  void _calculateResult(int score) {
    switch (_turn) {
      case 1:
        if (score <= _p1Points) {
          _p1Points = _p1Points - score;
        }
        _turn = 2;
        break;
      case 2:
        if (score <= _p2Points) {
          _p2Points = _p2Points - score;
        }
        _turn = 1;
        break;
    }
    setState(() {});
  }

  bool _validScore(int value) {
    bool isValid = true;
    if (value > 180) {
      isValid = false;
    }
    return isValid;
  }

  void _checkLegs() {
    if (_p1Points == 0) {
      _p1Legs++;
      _p1Points = 501;
      _p2Points = 501;
    }
    if (_p2Points == 0) {
      _p2Legs++;
      _p1Points = 501;
      _p2Points = 501;
    }
  }

  void _checkSets() {
    if (_p1Legs == _maxLegs) {
      _p1Legs = 0;
      _p1Sets++;
    }
    if (_p2Legs == _maxLegs) {
      _p2Legs = 0;
      _p2Sets++;
    }
  }

  void _checkWin() {
    if (_p1Sets == _maxSets) {
      _p1Win = true;
    }
    if (_p2Sets == _maxSets) {
      _p2Win = true;
    }
    if (_p1Win || _p2Win) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(homeRoute, (Route<dynamic> route) => false);
    }
  }

  void _updateCheckouts() {
    switch (_turn) {
      case 1:
        checkouts = calculateCheckout(_p1Points);
        break;
      case 2:
        checkouts = calculateCheckout(_p2Points);
        break;
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _args = ModalRoute.of(context)!.settings.arguments as List<String>;
    });
    _score = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _args ??= ModalRoute.of(context)?.settings.arguments as List<String>?;
    _player1 = _args![0];
    _player2 = _args![1];
    _maxLegs = int.parse(_args![2]);
    _maxSets = int.parse(_args![3]);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 27, 27),
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Container(
                    width: 5,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: _turn == 1
                                ? Border.all(color: Colors.blueAccent, width: 5)
                                : Border.all(color: Colors.black, width: 5),
                          ),
                          width: double.infinity,
                          height: constraints.maxHeight * 0.15,
                          child: Center(
                            child: Text(
                              _player1,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 35),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: constraints.maxHeight * 0.2,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                _p1Points.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 75),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 5,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: constraints.maxHeight * 0.2,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                "$_p1Sets   Sets   $_p2Sets",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 35),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: constraints.maxHeight * 0.2,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                "$_p1Legs   Legs   $_p2Legs",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 35),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 5,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: _turn == 2
                                ? Border.all(color: Colors.blueAccent, width: 5)
                                : Border.all(color: Colors.black, width: 5),
                          ),
                          width: double.infinity,
                          height: constraints.maxHeight * 0.15,
                          child: Center(
                            child: Text(
                              _player2,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 35),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: constraints.maxHeight * 0.2,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                _p2Points.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 75),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 5,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.white, width: 5),
              ),
              width: double.infinity,
              height: constraints.maxHeight * 0.3,
              child: ListView.builder(
                itemCount: checkouts.length,
                itemBuilder: (context, index) {
                  return Text(
                    checkouts[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 92, 199, 96), fontSize: 50),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: constraints.maxHeight * 0.15,
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white, width: 5)),
              child: TextField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Puntuación",
                    hintStyle: TextStyle(color: Colors.white)),
                style: const TextStyle(color: Colors.white, fontSize: 75),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                autofocus: true,
                controller: _score,
                textAlign: TextAlign.center,
                onSubmitted: (value) {
                  if (value != "") {
                    if (_validScore(int.parse(value))) {
                      _calculateResult(int.parse(value));
                      _checkLegs();
                      _checkSets();
                      _checkWin();
                      _updateCheckouts();
                    }
                  }
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
