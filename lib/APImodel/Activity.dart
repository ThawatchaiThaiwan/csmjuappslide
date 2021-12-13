import 'dart:convert';

List<Activity> activityFromJson(String str) =>
    List<Activity>.from(json.decode(str).map((x) => Activity.fromJson(x)));

String activityToJson(List<Activity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Activity {
  Activity({
    required this.activity_pictureId,
    required this.Activitypic_Title,
    required this.Activity_Date,
    required this.Activitypic_Detail,
    required this.Activity_Picture,
  });

  int activity_pictureId;
  String Activitypic_Title;
  String Activity_Date;
  String Activitypic_Detail;
  String Activity_Picture;

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      activity_pictureId: json["activity_pictureId"] as int,
      Activitypic_Title: json["Activitypic_Title"] as String,
      Activity_Date: json["Activity_Date"] as String,
      Activitypic_Detail: json["Activitypic_Detail"] as String,
      Activity_Picture: json["Activity_Picture"] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        "activity_pictureId": activity_pictureId,
        "Activity_Date": Activity_Date,
        "Activitypic_Detail": Activitypic_Detail,
        "Activity_Picture": Activity_Picture,
      };

  static List<Activity> activitysFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Activity.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Activity {  image: $Activity_Picture, }';
  }
}
