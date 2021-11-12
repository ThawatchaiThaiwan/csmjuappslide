// To parse this JSON data, do
//
//     final postAppeal = postAppealFromJson(jsonString);

import 'dart:convert';

PostAppeal postAppealFromJson(String str) => PostAppeal.from(json.decode(str).map((x) => PostAppeal.fromJson(x)));

String postAppealToJson(PostAppeal data) => json.encode(data.toJson());

class PostAppeal {
    PostAppeal({
        required this.complainId,
        required this.complainDetail,
        required this.complainDate,
        required this.complainPicture,
        required this.complainTitle,
    });

    int complainId;
    String complainDetail;
    String complainDate;
    String complainPicture;
    String complainTitle;

    factory PostAppeal.fromJson(Map<String, dynamic> json) => PostAppeal(
        complainId: json["complainId"],
        complainDetail: json["Complain_Detail"],
        complainDate: json["Complain_Date"],
        complainPicture: json["Complain_Picture"],
        complainTitle: json["Complain_Title"],
    );

    Map<String, dynamic> toJson() => {
        "complainId": complainId,
        "Complain_Detail": complainDetail,
        "Complain_Date": complainDate,
        "Complain_Picture": complainPicture,
        "Complain_Title": complainTitle,
    };

  static from(map) {}

  
}
