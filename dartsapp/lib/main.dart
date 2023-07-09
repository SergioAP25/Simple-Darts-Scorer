import 'package:dartsapp/ui/game.dart';
import 'package:dartsapp/ui/home_view.dart';
import 'package:dartsapp/ui/play_view.dart';
import 'package:dartsapp/ui/winner_view.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:window_size/window_size.dart';

import 'constants/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  setWindowTitle('Simple Darts Scorer');
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
      home: const HomeView(),
      routes: {
        homeRoute: (context) => const HomeView(),
        playRoute: (context) => const PlayView(),
        gameRoute: (context) => const Game(),
        winnerRoute: (context) => const WinnerView()
      },
    );
  }
}
