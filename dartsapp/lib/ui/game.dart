import 'dart:ui';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<String>? _playerNames;
  late String _player1;
  late String _player2;
  int _p1Points = 501;
  int _p2Points = 501;
  late final TextEditingController _score;
  int? _turn = 1;

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

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _playerNames = ModalRoute.of(context)!.settings.arguments as List<String>;
    });
    _score = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _playerNames ??=
        ModalRoute.of(context)?.settings.arguments as List<String>?;
    _player1 = _playerNames![0];
    _player2 = _playerNames![1];
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 50,
                          color: Colors.grey,
                          child: Center(child: Text(_player1)),
                        ),
                        Container(
                          height: 5,
                          color: Colors.white,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          color: Colors.grey,
                          child: Center(child: Text(_p1Points.toString())),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 50,
                          color: Colors.grey,
                          child: Center(child: Text("SETS")),
                        ),
                        Container(
                          height: 5,
                          color: Colors.white,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          color: Colors.grey,
                          child: Center(child: Text("LEGS")),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 50,
                          color: Colors.grey,
                          child: Center(child: Text(_player2)),
                        ),
                        Container(
                          height: 5,
                          color: Colors.white,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          color: Colors.grey,
                          child: Center(child: Text(_p2Points.toString())),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 5,
                width: double.infinity,
                color: Colors.white,
              ),
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.grey,
              ),
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.grey,
              ),
              Container(
                height: 5,
                width: double.infinity,
                color: Colors.white,
              ),
              Container(
                width: 500,
                height: 50,
                color: Colors.grey,
                child: TextField(
                  autofocus: true,
                  controller: _score,
                  textAlign: TextAlign.center,
                  onSubmitted: (value) {
                    if (_validScore(int.parse(value))) {
                      _calculateResult(int.parse(value));
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
