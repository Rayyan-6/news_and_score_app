import 'package:sem_project_new/UI%20Pages/HomePage.dart';


class SoccerMatch {
  Fixture fixture;
  Status status;
  Team home;
  Team away;
  Goal goal;
  Venue venue;
  SoccerMatch(this.fixture, this.status,this.home, this.away, this.goal,this.venue);
  factory SoccerMatch.fromJson(Map<String, dynamic> json) {
    return SoccerMatch(
        Fixture.fromJson(json['fixture']),
        Status.fromJson(json['fixture']['status'] ?? {}), //from Status.fromJson(json['status']) to Status.fromJson(json['fixture']['status'])
        Team.fromJson(json['teams']['home'], true), // Pass true for home team
        Team.fromJson(json['teams']['away'], false), // Pass false for away team
        // Team.fromJson(json['teams']['home']),
        // Team.fromJson(json['teams']['away']),
        Goal.fromJson(json['goals']??{}),
        Venue.fromJson(json['venue']??{})
    );
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
  bool? winner; // ? null safety
  Team(this.id, this.name, this.logoUrl, this.winner);
  factory Team.fromJson(Map<String, dynamic> json,bool isHome) {
    return Team(json['id'], json['name'], json['logo'],
        isHome ? json['winner'] : null, // Set winner only for home team
        // json['winner']
    );
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


class Venue {
  String name;
  String city;
  Venue(this.name, this.city);

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(json['name']?? 'null', json['city']?? 'null');
  }
}
