import 'package:dartsapp/domain/models/current_game_model.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class DomainEvent {
  const DomainEvent();
}

class GetCurrentGameEvent extends DomainEvent {
  const GetCurrentGameEvent();
}

class InsertCurrentGameEvent extends DomainEvent {
  final CurrentGameModel currentGame;
  const InsertCurrentGameEvent(this.currentGame);
}

class DeleteCurrentGameEvent extends DomainEvent {
  const DeleteCurrentGameEvent();
}

class CountCurrentGameEvent extends DomainEvent {
  const CountCurrentGameEvent();
}
