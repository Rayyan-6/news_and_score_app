
class BasketballMatch{
  Team home;
  Team away;
  Status status;
  Score score;
  League league;

  BasketballMatch({
    required this.home,
    required this.away,
    required this.status,
    required this.score,
    required this.league,
  });

  factory BasketballMatch.fromJson(Map<String, dynamic> json) {
    return BasketballMatch(
      home: Team.fromJson(json['teams']['home']),
      away: Team.fromJson(json['teams']['away']),
      status: Status.fromJson(json['status']),
      score: Score.fromJson(json['score']),
      league: League.fromJson(json['league']),
    );
  }
}

class Team{
  int id;
  String name;
  String logoUrl;
  Team(this.id, this.name, this.logoUrl);
  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(json['id'], json['name'], json['logo']);
  }

}

class League{
  int id;
  String name;
  String season;
  String logoUrl;

  League(this.id, this.name,this.season,this.logoUrl);
  factory League.fromJson(Map<String, dynamic> json) {
    return League(json['id'], json['name'],json['season'],json['logo']);
  }
}

class Status{
  String long;
  String timer;
  Status(this.long,this.timer);
  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(json['long'],json['timer']);
  }

}

class Score {
  int home;
  int away;
  Score(this.home, this.away);
  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(json['scores']['home']['total'], json['scores']['away']['total']);
  }
}