import 'package:bloc/bloc.dart';
import 'package:dartsapp/domain/get_current_game.dart';
import 'package:dartsapp/domain/insert_current_game.dart';
import '../delete_current_game.dart';
import 'domain_event.dart';
import 'domain_state.dart';

class DomainBloc extends Bloc<DomainEvent, DomainState> {
  final GetCurrentGame _getCurrentGame = GetCurrentGame();
  final InsertCurrentGame _insertCurrentGame = InsertCurrentGame();
  final DeleteCurrentGame _deleteCurrentGame = DeleteCurrentGame();

  DomainBloc() : super(const DomainStateInitial()) {
    on<GetCurrentGameEvent>((event, emit) async {
      try {
        final result = await _getCurrentGame.getCurrentGame();
        emit(DomainStateLoadedCurrentGame(result));
      } catch (e) {
        emit(const DomainError("An error ocurred"));
      }
    });

    on<InsertCurrentGameEvent>((event, emit) async {
      try {
        _insertCurrentGame.insertCurrentGame(event.currentGame);
        emit(const DomainStateLoaded());
      } catch (e) {
        emit(const DomainError("An error ocurred"));
      }
    });

    on<DeleteCurrentGameEvent>((event, emit) async {
      try {
        await _deleteCurrentGame.deleteCurrentGame();
        emit(const DomainStateLoaded());
      } catch (e) {
        emit(const DomainError("An error ocurred"));
      }
    });
  }
}
