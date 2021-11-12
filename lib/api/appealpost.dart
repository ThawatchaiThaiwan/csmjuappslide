// To parse this JSON data, do
//
//     final complain = complainFromJson(jsonString);

import 'dart:convert';

List<Complain> complainFromJson(String str) => List<Complain>.from(json.decode(str).map((x) => Complain.fromJson(x)));



class Complain {
    Complain({
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

    factory Complain.fromJson(Map<String, dynamic> json) {
      return Complain(
        complainId: json["complainId"],
        complainDetail: json["Complain_Detail"],
        complainDate: json["Complain_Date"],
        complainPicture: json["Complain_Picture"],
        complainTitle: json["Complain_Title"],
      );
    }
    

    
}
