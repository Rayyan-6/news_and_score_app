import 'package:sem_project_new/UI%20Pages/HomePage.dart';




class SoccerMatch {
  Fixture fixture;
  Status status;
  Team home;
  Team away;
  Goal goal;
  SoccerMatch(this.fixture, this.status,this.home, this.away, this.goal);
  factory SoccerMatch.fromJson(Map<String, dynamic> json) {
    return SoccerMatch(
        Fixture.fromJson(json['fixture']),
        Status.fromJson(json['fixture']['status'] ?? {}), //from Status.fromJson(json['status']) to Status.fromJson(json['fixture']['status'])
        Team.fromJson(json['teams']['home']),
        Team.fromJson(json['teams']['away']),
        Goal.fromJson(json['goals']??{}) );
  }
}

class Fixture {
  int? id;// added null safety
  String date;
  Status status;
  Fixture(this.id, this.date, this.status);
  factory Fixture.fromJson(Map<String, dynamic> json) {
    return Fixture(json['id'], json['date']
        ,  Status.fromJson(json['status']) // from json['status'] to Status.fromJson(json['status'])
    );
  }
}

class Status {
  int elapsed; //////////////////
  String long;
  Status(this.elapsed, this.long);
  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(json['elapsed'] ?? 0 // added null safety
        , json['long'] ?? '' // added null safety
    );
    // return Status(
    //   json['fixture']['status']['elapsed'] ?? 0,
    //   json['fixture']['status']['long'] ?? '',
    // );
  }
}


class Team {
  int id;
  String name;
  String logoUrl;
  bool? winner; // ? null safety --> added by bilal
  Team(this.id, this.name, this.logoUrl, this.winner);
  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(json['id'], json['name'], json['logo'], json['winner']);
  }
}

class Goal {
  int home;
  int away;
  Goal(this.home, this.away);

  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(json['home']?? 0, json['away']?? 0);
  }
}
