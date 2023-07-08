import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants/routes.dart';

class WinnerView extends StatefulWidget {
  const WinnerView({super.key});

  @override
  State<WinnerView> createState() => _WinnerViewState();
}

class _WinnerViewState extends State<WinnerView> {
  List<String>? _args;
  late String _player1;
  late String _player2;
  late int _maxLegs;
  late int _maxSets;
  late String _winner;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _args = ModalRoute.of(context)!.settings.arguments as List<String>;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _args ??= ModalRoute.of(context)?.settings.arguments as List<String>?;
    _player1 = _args![0];
    _player2 = _args![1];
    _maxLegs = int.parse(_args![2]);
    _maxSets = int.parse(_args![3]);
    _winner = _args![4];

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Image.asset(
                  "assets/winner.jpg",
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
                height: constraints.maxHeight * 0.75,
                width: constraints.maxWidth * 0.5,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 3,
                      blurRadius: 5,
                      color: Color.fromARGB(255, 194, 167, 17).withOpacity(0.3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        "El ganador es:",
                        style: TextStyle(color: Colors.green, fontSize: 50),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "${_winner}",
                        style: TextStyle(
                            color: Color.fromARGB(255, 236, 107, 98),
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        height: 200,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: 500,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.8),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 3,
                              blurRadius: 5,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                gameRoute, (Route<dynamic> route) => false,
                                arguments: [
                                  _player1,
                                  _player2,
                                  _maxLegs.toString(),
                                  _maxSets.toString()
                                ]);
                          },
                          child: const Text(
                            "Volver a jugar",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 35, color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        height: 10,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: 500,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 3,
                              blurRadius: 5,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                homeRoute, (Route<dynamic> route) => false);
                          },
                          child: const Text(
                            "Ir al menú principal",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 35, color: Colors.green),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}