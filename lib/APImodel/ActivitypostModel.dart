// To parse this JSON data, do
//
//     final complain = complainFromJson(jsonString);

import 'dart:convert';



List<ActivityPostmodel> activityPostmodelFromJson(String str) =>
    List<ActivityPostmodel>.from(
        json.decode(str).map((x) => ActivityPostmodel.fromJson(x)));

/* String activityToJson(List<Activity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson()))); */

class ActivityPostmodel {
  ActivityPostmodel({
    
    required this.nameTh,
    required this.surnameTh,
    required this.Email,
    required this.studentCode,
    required this.Activity_Start,
    required this.Status,
    required this.Activity_Title,
  });


  String nameTh;
  String surnameTh;
  String Email;
  String studentCode;
  String Activity_Start;
  String Status;
  String Activity_Title;

  factory ActivityPostmodel.fromJson(Map<String, dynamic> json) {
    return ActivityPostmodel(
      
      nameTh: json["nameTh"],
      surnameTh: json["surnameTh"],
      Email: json["Email"],
      studentCode: json["studentCode"],
      Activity_Start: json["Activity_Start"],
      Status: json["Status"],
      Activity_Title: json["Activity_Title"],
    );
  }
}
