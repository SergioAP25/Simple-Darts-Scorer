import 'package:dartsapp/data/services/database/models/database_current_game_model.dart';

class CurrentGameModel {
  final String player1;
  final int player1Points;
  final int player1Legs;
  final int player1Sets;
  final String player2;
  final int player2Points;
  final int player2Legs;
  final int player2Sets;
  final int turn;

  CurrentGameModel(
      this.player1,
      this.player1Points,
      this.player1Legs,
      this.player1Sets,
      this.player2,
      this.player2Points,
      this.player2Legs,
      this.player2Sets,
      this.turn);

  static CurrentGameModel fromDatabase(
      CurrentGameDatabaseModel currentGameDatabaseModel) {
    return CurrentGameModel(
        currentGameDatabaseModel.player1,
        currentGameDatabaseModel.player1Points,
        currentGameDatabaseModel.player1Legs,
        currentGameDatabaseModel.player1Sets,
        currentGameDatabaseModel.player2,
        currentGameDatabaseModel.player2Points,
        currentGameDatabaseModel.player2Legs,
        currentGameDatabaseModel.player2Sets,
        currentGameDatabaseModel.turn);
  }
}
