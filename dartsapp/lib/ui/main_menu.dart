import 'dart:ui';

import 'package:dartsapp/constants/routes.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Image.asset(
              "assets/background.jpg",
              fit: BoxFit.cover,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 30.0,
              sigmaY: 30.0,
            ),
          ),
          const Home()
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final TextEditingController _player1;
  late final TextEditingController _player2;

  @override
  void initState() {
    _player1 = TextEditingController();
    _player2 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _player1.dispose();
    _player2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 350,
            height: 50,
            child: Container(
              color: const Color.fromARGB(255, 19, 18, 18),
              child: TextField(
                controller: _player1,
                style: const TextStyle(color: Colors.blue),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Colors.blue),
                  hintStyle: TextStyle(color: Colors.blue),
                  hintText: "Jugador 1",
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 350,
            height: 50,
            child: Container(
              color: const Color.fromARGB(255, 19, 18, 18),
              child: TextField(
                controller: _player2,
                style: const TextStyle(color: Colors.blue),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Colors.blue),
                  hintStyle: TextStyle(color: Colors.blue),
                  hintText: "Jugador 2",
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
              width: 350,
              height: 50,
              child: Container(
                  color: Colors.black,
                  child: TextButton(
                    onPressed: () {
                      if (_player1.text != "" && _player2.text != "") {
                        Navigator.of(context).pushNamed(gameRoute,
                            arguments: [_player1.text, _player2.text]);
                      }
                    },
                    child: const Text(
                      "Comenzar",
                    ),
                  )))
        ],
      ),
    ));
  }
}
