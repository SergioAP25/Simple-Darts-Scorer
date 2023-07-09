import '../data/repository.dart';

class DeleteCurrentGame {
  final DartsRepository _repository = DartsRepository();

  Future<void> deleteCurrentGame() async {
    await _repository.deleteCurrentGame();
  }
}
