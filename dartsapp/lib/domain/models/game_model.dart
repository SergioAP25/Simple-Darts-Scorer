class ScoresList {
  List<GameModel> scoresList = [];

  ScoresList(this.scoresList);

  ScoresList.fromJson(Map<String, dynamic> json) {
    if (json["scores_list"] != null) {
      scoresList = <GameModel>[];
      json["scores_list"].forEach((v) {
        scoresList.add(GameModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["scores_list"] = scoresList.map((v) => v.toJson()).toList();
    return data;
  }
}

class GameModel {
  int score = 0;
  int previousP1Score = 0;
  int previousP2Score = 0;
  bool gameLeg = false;
  bool gameSet = false;

  GameModel(this.score);

  GameModel.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    previousP1Score = json['previous_p1_score'];
    previousP2Score = json['previous_p2_score'];
    gameLeg = json['gameLeg'];
    gameSet = json['gameSet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['score'] = score;
    data['previous_p1_score'] = previousP1Score;
    data['previous_p2_score'] = previousP2Score;
    data['gameLeg'] = gameLeg;
    data['gameSet'] = gameSet;

    return data;
  }
}
