import 'dart:convert';

import 'package:dartsapp/domain/models/current_game_model.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'constants/database_constants.dart';
import 'exceptions/database_exceptions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import 'models/database_current_game_model.dart';

class DartsService {
  Database? _db;

  static final DartsService _dartsService = DartsService._sharedInstance();

  factory DartsService() {
    return _dartsService;
  }

  DartsService._sharedInstance();

  Future<void> _ensureDbIsOpen() async {
    try {
      await _open();
    } on DatabaseAlreadyOpen {
      //empty
    }
  }

  Database _getDatabaseOrThrow() {
    final db = _db;
    if (db == null) {
      throw DatabaseIsNotOpen();
    } else {
      return db;
    }
  }

  Future<void> _open() async {
    if (_db != null) {
      throw DatabaseAlreadyOpen();
    }
    try {
      final docsPath = await getApplicationDocumentsDirectory();
      final dbPath = join(docsPath.path, dbName);
      final db = await openDatabase(dbPath);
      _db = db;

      await db.execute(createCurrentGameTable);
    } on MissingPlatformDirectoryException {
      throw UnableToGetDocumentsDirectory();
    }
  }

  Future<void> _close() async {
    final db = _db;
    if (db == null) {
      throw DatabaseIsNotOpen();
    } else {
      await db.close();
      _db = null;
    }
  }

  Future<void> insertCurrentGame(
      {required CurrentGameModel currentGame}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    await db.insert(
        currentGameTable,
        {
          player1Column: currentGame.player1,
          player1PointsColumn: currentGame.player1Points,
          player1LegsColumn: currentGame.player1Legs,
          player1SetsColumn: currentGame.player1Sets,
          player2Column: currentGame.player2,
          player2PointsColumn: currentGame.player2Points,
          player2LegsColumn: currentGame.player2Legs,
          player2SetsColumn: currentGame.player2Sets,
          maxLegsColumn: currentGame.maxLegs,
          maxSetsColumn: currentGame.maxSets,
          scoreListColumn: jsonEncode(currentGame.scoreList.toJson()),
          turnColumn: currentGame.turn,
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<CurrentGameDatabaseModel> getCurrentGame() async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();

    final results = await db.query(
      currentGameTable,
    );
    return CurrentGameDatabaseModel.fromRow(results.first);
  }

  Future<int> deleteCurrentGame() async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();

    await db.rawQuery("DELETE FROM currentGame");
    return 1;
  }

  Future<int> countCurrentGame() async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();

    final result = await db.rawQuery("SELECT COUNT(*) FROM currentGame");

    return result.first["COUNT(*)"] as int;
  }
}
