import 'package:dartsapp/data/services/database/constants/database_constants.dart';
import 'package:flutter/cupertino.dart';

@immutable
class MatchHistoryGameDatabaseModel {
  final int id;
  final String player1;
  final String player2;
  final String winner;
  final String date;

  const MatchHistoryGameDatabaseModel(
      this.id, this.player1, this.player2, this.winner, this.date);

  MatchHistoryGameDatabaseModel.fromRow(Map<String, Object?> map)
      : id = map[matchHistoryIdColumn] as int,
        player1 = map[mhPlayer1Column] as String,
        player2 = map[mhPlayer2Column] as String,
        winner = map[winnerColumn] as String,
        date = map[dateColumn] as String;
}
