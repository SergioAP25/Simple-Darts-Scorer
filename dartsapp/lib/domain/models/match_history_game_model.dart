import 'package:dartsapp/data/services/database/models/database_match_history_game_model.dart';

class MatchHistoryGameModel {
  final String player1;
  final String player2;
  final String winner;
  final String date;

  MatchHistoryGameModel(this.player1, this.player2, this.winner, this.date);

  static MatchHistoryGameModel fromDatabase(
      MatchHistoryGameDatabaseModel matchHistoryGameDatabaseModel) {
    return MatchHistoryGameModel(
        matchHistoryGameDatabaseModel.player1,
        matchHistoryGameDatabaseModel.player2,
        matchHistoryGameDatabaseModel.winner,
        matchHistoryGameDatabaseModel.date);
  }
}
