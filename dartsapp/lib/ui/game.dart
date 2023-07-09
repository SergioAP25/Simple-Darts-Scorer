import 'dart:ui';

import 'package:dartsapp/constants/routes.dart';
import 'package:dartsapp/constants/views.dart';
import 'package:dartsapp/domain/bloc/domain_bloc.dart';
import 'package:dartsapp/domain/bloc/domain_event.dart';
import 'package:dartsapp/domain/models/current_game_model.dart';
import 'package:dartsapp/util/dart_checkouts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../domain/bloc/domain_state.dart';

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
  int _turn = 1;
  bool _p1Win = false;
  bool _p2Win = false;
  List<String> _checkouts = ["", "", "", ""];
  final List<int> _scoreList = [];
  String _view = "";
  final DomainBloc _gameBloc = DomainBloc();
  bool init = false;

  void _calculateResult(int score) {
    int aux;
    switch (_turn) {
      case 1:
        if (score <= _p1Points) {
          aux = _p1Points - score;
          if (aux != 1) {
            _p1Points = _p1Points - score;
            _scoreList.add(score);
          } else {
            _scoreList.add(0);
          }
        } else {
          _scoreList.add(0);
        }
        _turn = 2;
        break;
      case 2:
        if (score <= _p2Points) {
          aux = _p2Points - score;
          if (aux != 1) {
            _p2Points = _p2Points - score;
            _scoreList.add(score);
          } else {
            _scoreList.add(0);
          }
        } else {
          _scoreList.add(0);
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
    String winner = "";
    if (_p1Sets == _maxSets) {
      _p1Win = true;
      winner = _player1;
    }
    if (_p2Sets == _maxSets) {
      _p2Win = true;
      winner = _player2;
    }
    if (_p1Win || _p2Win) {
      Navigator.of(context).pushReplacementNamed(winnerRoute, arguments: [
        _player1,
        _player2,
        _maxLegs.toString(),
        _maxSets.toString(),
        winner
      ]);
    }
  }

  void _updateCheckouts() {
    switch (_turn) {
      case 1:
        _checkouts = calculateCheckout(_p1Points);
        break;
      case 2:
        _checkouts = calculateCheckout(_p2Points);
        break;
    }
  }

  void _undo() {
    if (_scoreList.isNotEmpty) {
      switch (_turn) {
        case 1:
          _p2Points = _p2Points + _scoreList.last;
          _turn = 2;
          break;
        case 2:
          _p1Points = _p1Points + _scoreList.last;
          _turn = 1;
          break;
      }
      _scoreList.removeLast();
    }
    _updateCheckouts();
    setState(() {});
  }

  void _manageInit() {
    if (!init) {
      if (_view == newGame) {
        _player1 = _args![1];
        _player2 = _args![2];
        _maxLegs = int.parse(_args![3]);
        _maxSets = int.parse(_args![4]);
        _gameBloc.add(InsertCurrentGameEvent(CurrentGameModel(
            _player1,
            _p1Points,
            _p1Legs,
            _p1Sets,
            _player2,
            _p2Points,
            _p2Legs,
            _p2Sets,
            _turn)));
      }
      if (_view == currentGame) {
        _player1 = "";
        _player2 = "";
        _maxLegs = 1;
        _maxSets = 1;
        _gameBloc.add(const GetCurrentGameEvent());
      }
      init = true;
    }
  }

  @override
  void initState() {
    _score = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _score.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _args = ModalRoute.of(context)?.settings.arguments as List<String>?;
    _view = _args![0];

    _manageInit();

    return BlocProvider(
      create: (context) => _gameBloc,
      child: BlocListener<DomainBloc, DomainState>(
        listener: (context, state) {
          if (state is DomainStateLoadedCurrentGame) {
            _player1 = state.currentgame.player1;
            _p1Points = state.currentgame.player1Points;
            _p1Legs = state.currentgame.player1Legs;
            _p1Sets = state.currentgame.player1Sets;
            _player2 = state.currentgame.player2;
            _p2Points = state.currentgame.player2Points;
            _p2Legs = state.currentgame.player2Legs;
            _p2Sets = state.currentgame.player2Sets;
            _turn = state.currentgame.turn;
            setState(() {});
          }
        },
        child: Scaffold(body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: Image.asset(
                    "assets/test.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5.0,
                    sigmaY: 5.0,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                  ),
                ),
                Container(
                  width: constraints.maxWidth * 0.95,
                  height: constraints.maxHeight * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Flexible(
                                      child: Container(
                                        height: 100,
                                        width: 400,
                                        decoration: BoxDecoration(
                                            color: _turn == 1
                                                ? const Color.fromRGBO(
                                                    71, 209, 69, 0.5)
                                                : const Color.fromRGBO(
                                                    243, 150, 150, 0.5),
                                            border: Border(
                                              right: _turn == 1
                                                  ? const BorderSide(
                                                      color: Color.fromRGBO(
                                                          31, 71, 31, 0.498),
                                                      width: 10)
                                                  : const BorderSide(
                                                      color: Color.fromRGBO(
                                                          140, 20, 20, 0.5),
                                                      width: 10),
                                            )),
                                        child: Center(
                                          child: Text(
                                            _player1,
                                            style: GoogleFonts.anton(
                                                textStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 50)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Flexible(
                                      child: Container(
                                        height: 150,
                                        width: 400,
                                        decoration: const BoxDecoration(
                                            color: Color.fromRGBO(
                                                243, 150, 150, 0.5),
                                            border: Border(
                                                right: BorderSide(
                                                    color: Color.fromRGBO(
                                                        140, 20, 20, 0.5),
                                                    width: 10),
                                                bottom: BorderSide(
                                                    color: Color.fromRGBO(
                                                        200, 32, 32, 0.5),
                                                    width: 10))),
                                        child: Center(
                                          child: Text(
                                            "$_p1Points",
                                            style:
                                                GoogleFonts.zcoolQingKeHuangYou(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 100,
                                                        letterSpacing: 5)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 15, top: 15),
                                        child: Container(
                                          height: 100,
                                          width: 400,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: const Color.fromRGBO(
                                                      140, 20, 20, 0.5),
                                                  width: 4),
                                              color: const Color.fromRGBO(
                                                  243, 150, 150, 0.5),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(35))),
                                          child: Center(
                                            child: Text(
                                              "$_p1Sets Sets $_p2Sets",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 50),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 15, top: 15),
                                        child: Container(
                                          height: 100,
                                          width: 400,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: const Color.fromRGBO(
                                                      140, 20, 20, 0.5),
                                                  width: 4),
                                              color: const Color.fromRGBO(
                                                  243, 150, 150, 0.5),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(35))),
                                          child: Center(
                                            child: Text(
                                              "$_p1Legs Legs $_p2Sets",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 50),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Flexible(
                                      child: Container(
                                        height: 100,
                                        width: 400,
                                        decoration: BoxDecoration(
                                            color: _turn == 2
                                                ? const Color.fromRGBO(
                                                    71, 209, 69, 0.5)
                                                : const Color.fromRGBO(
                                                    243, 150, 150, 0.5),
                                            border: Border(
                                              left: _turn == 2
                                                  ? const BorderSide(
                                                      color: Color.fromRGBO(
                                                          31, 71, 31, 0.498),
                                                      width: 10)
                                                  : const BorderSide(
                                                      color: Color.fromRGBO(
                                                          140, 20, 20, 0.5),
                                                      width: 10),
                                            )),
                                        child: Center(
                                          child: Text(
                                            _player2,
                                            style: GoogleFonts.anton(
                                                textStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 50)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Flexible(
                                      child: Container(
                                        height: 150,
                                        width: 400,
                                        decoration: const BoxDecoration(
                                            color: Color.fromRGBO(
                                                243, 150, 150, 0.5),
                                            border: Border(
                                                left: BorderSide(
                                                    color: Color.fromRGBO(
                                                        140, 20, 20, 0.5),
                                                    width: 10),
                                                bottom: BorderSide(
                                                    color: Color.fromRGBO(
                                                        200, 32, 32, 0.5),
                                                    width: 10))),
                                        child: Center(
                                          child: Text(
                                            "$_p2Points",
                                            style:
                                                GoogleFonts.zcoolQingKeHuangYou(
                                                    textStyle: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 100,
                                                        letterSpacing: 5)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(150),
                                        bottomLeft: Radius.circular(150)),
                                    image: const DecorationImage(
                                      image:
                                          AssetImage('assets/greenFrame.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    color: Colors.black.withOpacity(0.85)),
                                width: 500,
                                height: 500,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        color: Colors.transparent,
                                        width: 495,
                                        height: 125,
                                        child: TextField(
                                          decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Puntuación",
                                              hintStyle: TextStyle(
                                                  color: Colors.white)),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 75),
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          autofocus: true,
                                          controller: _score,
                                          textAlign: TextAlign.center,
                                          onSubmitted: (value) {
                                            if (value != "") {
                                              if (_validScore(
                                                  int.parse(value))) {
                                                _calculateResult(
                                                    int.parse(value));
                                                _checkLegs();
                                                _checkSets();
                                                _checkWin();
                                                _updateCheckouts();
                                                _gameBloc.add(
                                                    InsertCurrentGameEvent(
                                                        CurrentGameModel(
                                                            _player1,
                                                            _p1Points,
                                                            _p1Legs,
                                                            _p1Sets,
                                                            _player2,
                                                            _p2Points,
                                                            _p2Legs,
                                                            _p2Sets,
                                                            _turn)));
                                              }
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        color: Colors.transparent,
                                        width: 495,
                                        height: 125,
                                        child: TextButton(
                                          onPressed: () {
                                            _undo();
                                          },
                                          child: const Text(
                                            "DESHACER",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 40),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: 500,
                                height: 500,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(150),
                                        bottomRight: Radius.circular(150)),
                                    image: const DecorationImage(
                                      image:
                                          AssetImage('assets/greenFrame.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    color: Colors.black.withOpacity(0.85)),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Flexible(
                                      child: Container(
                                        width: double.infinity,
                                        height: 50,
                                        color: Colors.transparent,
                                        child: const Text(
                                          "Posibilidades de cierre",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Flexible(
                                      child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          color: Colors.transparent,
                                          child: ListView.builder(
                                            itemCount: _checkouts.length,
                                            itemBuilder: (context, index) {
                                              return Text(
                                                _checkouts[index],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 92, 199, 96),
                                                    fontSize: 35),
                                              );
                                            },
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: constraints.maxWidth * 0.01,
                  top: constraints.maxHeight * 0.01,
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    iconSize: 50,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Positioned(
                  left: constraints.maxWidth * 0.942,
                  top: constraints.maxHeight * 0.01,
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    icon: const Icon(Icons.home),
                    color: Colors.white,
                    iconSize: 50,
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          homeRoute, (Route<dynamic> route) => false);
                    },
                  ),
                ),
              ],
            );
          },
        )),
      ),
    );
  }
}
