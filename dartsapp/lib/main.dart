import 'package:dartsapp/ui/game.dart';
import 'package:dartsapp/ui/main_menu.dart';
import 'package:flutter/material.dart';

import 'constants/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainMenu(),
      routes: {
        homeRoute: (context) => const MyApp(),
        gameRoute: (context) => const Game()
      },
    );
  }
}
