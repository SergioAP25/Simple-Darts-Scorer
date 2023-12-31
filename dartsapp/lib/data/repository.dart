import 'package:dartsapp/data/services/database/database_service.dart';
import 'package:dartsapp/domain/models/current_game_model.dart';
import 'package:dartsapp/domain/models/match_history_game_model.dart';

class DartsRepository {
  final DartsService _database = DartsService();

  static final DartsRepository _dartsRepository =
      DartsRepository._sharedInstance();

  factory DartsRepository() {
    return _dartsRepository;
  }

  DartsRepository._sharedInstance();

  Future<void> insertCurrentGame(CurrentGameModel currentGameModel) async {
    await _database.insertCurrentGame(currentGame: currentGameModel);
  }

  Future<CurrentGameModel> getCurrentGameFromDatabase() async {
    final result = await _database.getCurrentGame();
    return CurrentGameModel.fromDatabase(result);
  }

  Future<int> deleteCurrentGame() async {
    return await _database.deleteCurrentGame();
  }

  Future<int> countCurrentGame() async {
    final result = await _database.countCurrentGame();
    return result;
  }

  Future<void> insertMatchHistoryGame(
      MatchHistoryGameModel matchHistoryGameModel) async {
    await _database.insertMatchHistoryGame(
        matchHistoryGameModel: matchHistoryGameModel);
  }

  Future<List<MatchHistoryGameModel>> getMatchHistory() async {
    final result = await _database.getMatchHistory();
    return result.map((e) => MatchHistoryGameModel.fromDatabase(e)).toList();
  }
}
