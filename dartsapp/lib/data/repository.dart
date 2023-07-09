import 'package:dartsapp/data/services/database/database_service.dart';
import 'package:dartsapp/domain/models/current_game_model.dart';

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

  Future<void> deleteCurrentGame() async {
    await _database.deleteCurrentGame();
  }

  Future<int> countCurrentGame() async {
    final result = await _database.countCurrentGame();
    return result;
  }
}
