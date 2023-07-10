import 'package:dartsapp/domain/models/match_history_game_model.dart';

import '../data/repository.dart';

class InsertMatchHistoryGame {
  final DartsRepository _repository = DartsRepository();

  Future<void> insertMatchHistoryGame(
      MatchHistoryGameModel matchHistoryGameModel) async {
    await _repository.insertMatchHistoryGame(matchHistoryGameModel);
  }
}
