const dbName = "darts.db";
const currentGameTable = "currentGame";

// Current Game
const currentGameIdColumn = "id";
const player1Column = "player1";
const player1PointsColumn = "player1Points";
const player1LegsColumn = "player1Legs";
const player1SetsColumn = "player1Sets";
const player2Column = "player2";
const player2PointsColumn = "player2Points";
const player2LegsColumn = "player2Legs";
const player2SetsColumn = "player2Sets";

// Table creations
const createCurrentGameTable = """ CREATE TABLE IF NOT EXISTS "currentGame" (
        "id" INTEGER NOT NULL,
        "player1" TEXT NOT NULL,
        "player1Points" INTEGER NOT NULL,
        "player1Legs" INTEGER NOT NULL,
        "player1Sets" INTEGER NOT NULL,
        "player2" TEXT NOT NULL,
        "player2Points" INTEGER NOT NULL,
        "player2Legs" INTEGER NOT NULL,
        "player2Sets" INTEGER NOT NULL,
        PRIMARY KEY("id" AUTOINCREMENT)
      );""";
