const dbName = "darts.db";
const currentGameTable = "currentGame";
const matchHistoryTable = "matchHistory";

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
const maxLegsColumn = "maxLegs";
const maxSetsColumn = "maxSets";
const turnColumn = "turn";
const scoreListColumn = "scoreList";

// Match History
const matchHistoryIdColumn = "id";
const mhPlayer1Column = "player1";
const mhPlayer2Column = "player2";
const winnerColumn = "winner";
const dateColumn = "date";

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
        "maxLegs" INTEGER NOT NULL,
        "maxSets" INTEGER NOT NULL,
        "scoreList" TEXT NOT NULL,
        "turn" INTEGER NOT NULL,
        PRIMARY KEY("id" AUTOINCREMENT)
      );""";

const createMatchHistoryTable = """ CREATE TABLE IF NOT EXISTS "matchHistory" (
        "id" INTEGER NOT NULL,
        "player1" TEXT NOT NULL,
        "player2" TEXT NOT NULL,
        "winner" TEXT NOT NULL,
        "date" TEXT NOT NULL,
        PRIMARY KEY("id" AUTOINCREMENT)
      );""";
