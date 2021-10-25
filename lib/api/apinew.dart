// To parse this JSON data, do
//
//     final apinew = apinewFromJson(jsonString);

import 'dart:convert';

List<Apinew> apinewFromJson(String str) => List<Apinew>.from(json.decode(str).map((x) => Apinew.fromJson(x)));

String apinewToJson(List<Apinew> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Apinew {
    Apinew({
        required this.activityId,
        //this.activityStart,
        required this.activityTimeStart,
        required this.activityTimeEnd,
        required this.activityOrganizer,
        required this.activityLocation,
        required this.activityDetail,
        required this.activityTitle,
        //this.activityEnd,
    });

    final int activityId;
    //final DateTime activityStart;
    final String activityTimeStart;
    final String activityTimeEnd;
    final String activityOrganizer;
    final String activityLocation;
    final String activityDetail;
    final String activityTitle;
    //final DateTime activityEnd;

    factory Apinew.fromJson(Map<String, dynamic> json) => Apinew(
        activityId: json["activityId"] == null ? null : json["activityId"],
        //activityStart: json["Activity_Start"] == null ? null : DateTime.parse(json["Activity_Start"]),
        activityTimeStart: json["Activity_TimeStart"] == null ? null : json["Activity_TimeStart"],
        activityTimeEnd: json["Activity_TimeEnd"] == null ? null : json["Activity_TimeEnd"],
        activityOrganizer: json["Activity_Organizer"] == null ? null : json["Activity_Organizer"],
        activityLocation: json["Activity_Location"] == null ? null : json["Activity_Location"],
        activityDetail: json["Activity_Detail"] == null ? null : json["Activity_Detail"],
        activityTitle: json["Activity_Title"] == null ? null : json["Activity_Title"],
        //activityEnd: json["Activity_End"] == null ? null : DateTime.parse(json["Activity_End"]),
    );

    Map<String, dynamic> toJson() => {
        "activityId": activityId == null ? null : activityId,
        //"Activity_Start": activityStart == null ? null : "${activityStart.year.toString().padLeft(4, '0')}-${activityStart.month.toString().padLeft(2, '0')}-${activityStart.day.toString().padLeft(2, '0')}",
        "Activity_TimeStart": activityTimeStart == null ? null : activityTimeStart,
        "Activity_TimeEnd": activityTimeEnd == null ? null : activityTimeEnd,
        "Activity_Organizer": activityOrganizer == null ? null : activityOrganizer,
        "Activity_Location": activityLocation == null ? null : activityLocation,
        "Activity_Detail": activityDetail == null ? null : activityDetail,
        "Activity_Title": activityTitle == null ? null : activityTitle,
        //"Activity_End": activityEnd == null ? null : "${activityEnd.year.toString().padLeft(4, '0')}-${activityEnd.month.toString().padLeft(2, '0')}-${activityEnd.day.toString().padLeft(2, '0')}",
    };
}
