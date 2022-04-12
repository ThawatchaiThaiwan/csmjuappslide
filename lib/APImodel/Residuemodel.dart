// To parse this JSON data, do
//
//     final complain = complainFromJson(jsonString);

import 'dart:convert';

List<Residues> residuesFromJson(String str) => List<Residues>.from(json.decode(str).map((x) => Residues.fromJson(x)));



class Residues {
    Residues({
        required this.Subject_Internal,
        required this.Subject_External,
        required this.Residaual_Detail,
        required this.nameTh,
        required this.surnameTh,
        required this.EmailStudent,
        required this.mobile,
        required this.studentCode,
        required this.Sec_Internal,
        required this.Sec_External,
        required this.Subject60
    });

    
    String Subject_Internal;
    String Subject_External;
    String Residaual_Detail;
    String nameTh;
    String surnameTh;
    String EmailStudent;
    String mobile;
    String studentCode;
    String Sec_Internal;
    String Sec_External;
    String Subject60;

    factory Residues.fromJson(Map<String, dynamic> json) {
      return Residues(
        Subject_Internal: json["Subject_Internal"],
        Subject_External: json["Subject_External"],
        Residaual_Detail: json["Residaual_Detail"],
        nameTh: json["nameTh"],
        surnameTh: json["surnameTh"],
        EmailStudent: json["EmailStudent"],
        mobile: json["mobile"],
        studentCode: json["studentCode"],
        Sec_Internal: json["Sec_Internal"],
        Sec_External: json["Sec_External"],
        Subject60: json["Subject60"],
      );
    }
    

    
}
