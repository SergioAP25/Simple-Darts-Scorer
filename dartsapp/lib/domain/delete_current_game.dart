import '../data/repository.dart';

class DeleteCurrentGame {
  final DartsRepository _repository = DartsRepository();

  Future<int> deleteCurrentGame() async {
    return await _repository.deleteCurrentGame();
  }
}
