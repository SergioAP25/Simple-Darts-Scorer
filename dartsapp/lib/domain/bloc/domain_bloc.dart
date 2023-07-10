import 'package:bloc/bloc.dart';
import 'package:dartsapp/domain/get_current_game.dart';
import 'package:dartsapp/domain/get_match_history.dart';
import 'package:dartsapp/domain/insert_current_game.dart';
import '../count_current_game.dart';
import '../delete_current_game.dart';
import '../insert_match_history_game.dart';
import 'domain_event.dart';
import 'domain_state.dart';

class DomainBloc extends Bloc<DomainEvent, DomainState> {
  final GetCurrentGame _getCurrentGame = GetCurrentGame();
  final InsertCurrentGame _insertCurrentGame = InsertCurrentGame();
  final DeleteCurrentGame _deleteCurrentGame = DeleteCurrentGame();
  final CountCurrentGame _countCurrentGame = CountCurrentGame();
  final InsertMatchHistoryGame _insertMatchHistoryGame =
      InsertMatchHistoryGame();
  final GetMatchHistory _getMatchHistory = GetMatchHistory();

  DomainBloc() : super(const DomainStateInitial()) {
    on<InsertCurrentGameEvent>((event, emit) async {
      try {
        await _insertCurrentGame.insertCurrentGame(event.currentGame);
        emit(const DomainStateLoaded());
      } catch (e) {
        emit(const DomainError("An error ocurred"));
      }
    });

    on<GetCurrentGameEvent>((event, emit) async {
      try {
        final result = await _getCurrentGame.getCurrentGame();
        emit(DomainStateLoadedCurrentGame(result));
      } catch (e) {
        emit(const DomainError("An error ocurred"));
      }
    });

    on<DeleteCurrentGameEvent>((event, emit) async {
      try {
        final result = await _deleteCurrentGame.deleteCurrentGame();
        emit(DomainStateDeleted(result));
      } catch (e) {
        emit(const DomainError("An error ocurred"));
      }
    });

    on<CountCurrentGameEvent>((event, emit) async {
      try {
        final result = await _countCurrentGame.countCurrentGame();
        emit(DomainStateLoadedCountCurrentGame(result));
      } catch (e) {
        emit(const DomainError("An error ocurred"));
      }
    });

    on<InsertMatchHistoryGameEvent>((event, emit) async {
      try {
        await _insertMatchHistoryGame
            .insertMatchHistoryGame(event.matchHistoryGame);
        emit(const DomainStateLoaded());
      } catch (e) {
        emit(const DomainError("An error ocurred"));
      }
    });

    on<GetMatchHistoryEvent>((event, emit) async {
      try {
        final result = await _getMatchHistory.getMatchHistory();
        emit(DomainStateLoadedMatchHistory(result));
      } catch (e) {
        emit(const DomainError("An error ocurred"));
      }
    });
  }
}
