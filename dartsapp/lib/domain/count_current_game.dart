import '../data/repository.dart';

class CountCurrentGame {
  final DartsRepository _repository = DartsRepository();

  Future<int> countCurrentGame() async {
    return await _repository.countCurrentGame();
  }
}
