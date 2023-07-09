import 'package:dartsapp/domain/models/current_game_model.dart';

import '../data/repository.dart';

class InsertCurrentGame {
  final DartsRepository _repository = DartsRepository();

  Future<void> insertCurrentGame(CurrentGameModel currentGame) async {
    await _repository.deleteCurrentGame();
    await _repository.insertCurrentGame(currentGame);
  }
}
