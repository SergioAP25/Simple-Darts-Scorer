import 'package:dartsapp/ui/game.dart';
import 'package:dartsapp/ui/main_menu.dart';
import 'package:dartsapp/ui/winner_view.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

import 'constants/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setWindowTitle('Simple Darts Scorer');
  setWindowMinSize(const Size(1300, 740));
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
        gameRoute: (context) => const Game(),
        winnerRoute: (context) => const WinnerView()
      },
    );
  }
}
