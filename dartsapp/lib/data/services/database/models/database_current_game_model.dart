import 'package:dartsapp/data/services/database/constants/database_constants.dart';
import 'package:flutter/material.dart';

@immutable
class CurrentGameDatabaseModel {
  final int id;
  final String player1;
  final int player1Points;
  final int player1Legs;
  final int player1Sets;
  final String player2;
  final int player2Points;
  final int player2Legs;
  final int player2Sets;
  final int maxLegs;
  final int maxSets;
  final int turn;

  const CurrentGameDatabaseModel(
      this.id,
      this.player1,
      this.player1Points,
      this.player1Legs,
      this.player1Sets,
      this.player2,
      this.player2Points,
      this.player2Legs,
      this.player2Sets,
      this.maxLegs,
      this.maxSets,
      this.turn);

  CurrentGameDatabaseModel.fromRow(Map<String, Object?> map)
      : id = map[currentGameIdColumn] as int,
        player1 = map[player1Column] as String,
        player1Points = map[player1PointsColumn] as int,
        player1Legs = map[player1LegsColumn] as int,
        player1Sets = map[player1SetsColumn] as int,
        player2 = map[player2Column] as String,
        player2Points = map[player2PointsColumn] as int,
        player2Legs = map[player2LegsColumn] as int,
        player2Sets = map[player2SetsColumn] as int,
        maxLegs = map[maxLegsColumn] as int,
        maxSets = map[maxSetsColumn] as int,
        turn = map[turnColumn] as int;
}
