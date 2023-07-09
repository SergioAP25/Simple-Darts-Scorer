import 'package:dartsapp/data/repository.dart';
import 'package:dartsapp/domain/models/current_game_model.dart';

class GetCurrentGame {
  final DartsRepository _repository = DartsRepository();

  Future<CurrentGameModel> getCurrentGame() async {
    return await _repository.getCurrentGameFromDatabase();
  }
}
