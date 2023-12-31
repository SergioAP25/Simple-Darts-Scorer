import 'package:dartsapp/domain/models/current_game_model.dart';
import 'package:dartsapp/domain/models/match_history_game_model.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class DomainState {
  const DomainState();
}

class DomainStateInitial extends DomainState {
  const DomainStateInitial();
}

class DomainStateLoading extends DomainState {
  const DomainStateLoading();
}

class DomainStateLoaded extends DomainState {
  const DomainStateLoaded();
}

class DomainStateLoadedCurrentGame extends DomainState {
  final CurrentGameModel currentgame;
  const DomainStateLoadedCurrentGame(this.currentgame);
}

class DomainStateLoadedCountCurrentGame extends DomainState {
  final int currentGameCount;
  const DomainStateLoadedCountCurrentGame(this.currentGameCount);
}

class DomainStateDeleted extends DomainState {
  final int deleted;
  const DomainStateDeleted(this.deleted);
}

class DomainStateLoadedMatchHistory extends DomainState {
  final List<MatchHistoryGameModel> matchHistory;
  const DomainStateLoadedMatchHistory(this.matchHistory);
}

class DomainError extends DomainState {
  final String? error;
  const DomainError(this.error);
}
