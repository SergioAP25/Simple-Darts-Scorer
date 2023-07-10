import 'package:dartsapp/domain/models/match_history_game_model.dart';

import '../data/repository.dart';

class GetMatchHistory {
  final DartsRepository _repository = DartsRepository();

  Future<List<MatchHistoryGameModel>> getMatchHistory() async {
    return await _repository.getMatchHistory();
  }
}
