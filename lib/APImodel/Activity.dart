import 'dart:convert';

List<Activity> activityFromJson(String str) =>
    List<Activity>.from(json.decode(str).map((x) => Activity.fromJson(x)));

String activityToJson(List<Activity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Activity {
  Activity({
    required this.activityId,
    required this.Activity_Start,
    required this.Activity_TimeStart,
    required this.Activity_TimeEnd,
    required this.Activity_Organizer,
    required this.Activity_Location,
    required this.Activity_Detail,
    required this.Activity_Title,
    required this.Activity_Picture,
  });

  int activityId;
  String Activity_Start;
  String Activity_TimeStart;
  String Activity_TimeEnd;
  String Activity_Organizer;
  String Activity_Location;
  String Activity_Detail;
  String Activity_Title;
  String Activity_Picture;

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      activityId: json["activityId"] as int,
      Activity_Start: json["Activity_Start"] as String,
      Activity_TimeStart: json["Activity_TimeStart"] as String,
      Activity_TimeEnd: json["Activity_TimeEnd"] as String,
      Activity_Organizer: json["Activity_Organizer"] as String,
      Activity_Location: json["Activity_Location"] as String,
      Activity_Detail: json["Activity_Detail"] as String,
      Activity_Title: json["Activity_Title"] as String,   
      Activity_Picture: json["Activity_Picture"] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        "activityId": activityId,
        "Activity_Start": Activity_Start,
        "Activity_TimeStart": Activity_TimeStart,
        "Activity_TimeEnd": Activity_TimeEnd,
        "Activity_Organizer": Activity_Organizer,
        "Activity_Location": Activity_Location,
        "Activity_Detail": Activity_Detail,
        "Activity_Title": Activity_Title,     
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
