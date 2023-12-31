import 'dart:ui';

import 'package:dartsapp/constants/routes.dart';
import 'package:dartsapp/constants/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayView extends StatelessWidget {
  const PlayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
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
              const PlayViewWidgets(),
              Positioned(
                left: constraints.maxWidth * 0.01,
                top: constraints.maxHeight * 0.01,
                child: IconButton(
                  highlightColor: Colors.transparent,
                  icon: const Icon(Icons.arrow_back),
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
      ),
    );
  }
}

class PlayViewWidgets extends StatefulWidget {
  const PlayViewWidgets({super.key});

  @override
  State<PlayViewWidgets> createState() => _PlayViewWidgetsState();
}

class _PlayViewWidgetsState extends State<PlayViewWidgets> {
  late final TextEditingController _player1;
  late final TextEditingController _player2;
  late final TextEditingController _legs;
  late final TextEditingController _sets;

  @override
  void initState() {
    _player1 = TextEditingController();
    _player2 = TextEditingController();
    _legs = TextEditingController();
    _sets = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _player1.dispose();
    _player2.dispose();
    _legs.dispose();
    _sets.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            width: 500,
            height: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 19, 18, 18).withOpacity(0.8),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 3,
                  offset: const Offset(3, 3),
                  blurRadius: 5,
                  color:
                      const Color.fromARGB(255, 44, 193, 212).withOpacity(0.3),
                ),
              ],
            ),
            child: TextField(
              controller: _player1,
              style: GoogleFonts.pressStart2p(
                  textStyle: const TextStyle(color: Colors.blue)),
              decoration: const InputDecoration(
                label: Center(
                  child: Text(
                    "Jugador 1",
                  ),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(20),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: TextStyle(color: Colors.blue),
              ),
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Flexible(
          child: SizedBox(
            height: 5,
          ),
        ),
        Flexible(
          child: Container(
            width: 500,
            height: 50,
            color: const Color.fromARGB(255, 19, 18, 18).withOpacity(0.8),
            child: TextField(
              controller: _player2,
              style: GoogleFonts.pressStart2p(
                  textStyle: const TextStyle(color: Colors.blue)),
              decoration: const InputDecoration(
                label: Center(
                  child: Text(
                    "Jugador 2",
                  ),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(20),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: TextStyle(color: Colors.blue),
              ),
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Flexible(
          child: SizedBox(
            height: 5,
          ),
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  width: 248,
                  height: 50,
                  color: const Color.fromARGB(255, 19, 18, 18).withOpacity(0.8),
                  child: TextField(
                    controller: _legs,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    style: GoogleFonts.pressStart2p(
                        textStyle: const TextStyle(color: Colors.blue)),
                    decoration: const InputDecoration(
                      label: Center(
                        child: Text(
                          "Legs",
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle: TextStyle(color: Colors.blue),
                    ),
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Flexible(
                child: Container(
                  width: 248,
                  height: 50,
                  color: const Color.fromARGB(255, 19, 18, 18).withOpacity(0.8),
                  child: TextField(
                    controller: _sets,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    style: GoogleFonts.pressStart2p(
                        textStyle: const TextStyle(color: Colors.blue)),
                    decoration: const InputDecoration(
                      label: Center(
                        child: Text(
                          "Sets",
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle: TextStyle(color: Colors.blue),
                    ),
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Flexible(
          child: SizedBox(
            height: 5,
          ),
        ),
        Flexible(
          child: Container(
              width: 500,
              height: 50,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 3,
                      offset: const Offset(-3, -3),
                      blurRadius: 5,
                      color: const Color.fromARGB(255, 199, 30, 30)
                          .withOpacity(0.3),
                    ),
                  ],
                  color: Colors.black.withOpacity(0.8),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: TextButton(
                onPressed: () {
                  if (_player1.text != "" &&
                      _player2.text != "" &&
                      _legs.text != "" &&
                      _sets.text != "") {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        gameRoute, (Route<dynamic> route) => false,
                        arguments: [
                          newGame,
                          _player1.text,
                          _player2.text,
                          _legs.text,
                          _sets.text,
                        ]);
                  }
                },
                child: Text(
                  "Comenzar",
                  style: GoogleFonts.pressStart2p(),
                ),
              )),
        )
      ],
    ));
  }
}
