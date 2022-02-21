// To parse this JSON data, do
//
//     final complain = complainFromJson(jsonString);

import 'dart:convert';

List<ProfileP> profilePFromJson(String str) => List<ProfileP>.from(json.decode(str).map((x) => ProfileP.fromJson(x)));



class ProfileP {
    ProfileP({
        required this.studentId,
        required this.nameTh,
        required this.surnameTh,
        required this.nameEn,
        required this.surnameEn,
        required this.PictureProfile,
        required this.EmailStudent,
        required this.mobile,
        required this.Address,
        required this.studentCode,
    });

    
    String studentId;
    String nameTh;
    String surnameTh;
    String nameEn;
    String surnameEn;
    String PictureProfile;
    String EmailStudent;
    String mobile;
    String Address;
    String studentCode;

    factory ProfileP.fromJson(Map<String, dynamic> json) {
      return ProfileP(
        studentId: json["studentId"],
        nameTh: json["nameTh"],
        surnameTh: json["surnameTh"],
        nameEn: json["nameEn"],
        surnameEn: json["surnameEn"],
        PictureProfile: json["PictureProfile"],
        EmailStudent: json["EmailStudent"],
        mobile: json["mobile"],
        Address: json["Address"],
        studentCode: json["studentCode"],
      );
    }
    

    
}
