// To parse this JSON data, do
//
//

import 'dart:convert';

//List<ProfileP> profilePFromJson(String str) => List<ProfileP>.from(json.decode(str).map((x) => ProfileP.fromJson(x)));

class ProfileP {
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
    email,
  });

  factory ProfileP.fromJson(Map<String, dynamic> json) {
    return ProfileP(
      studentId: json["StudentId"] as String,
      nameTh: json["NameTh"] as String,
      surnameTh: json["SurnameTh"] as String,
      nameEn: json["NameEn"] as String,
      surnameEn: json["SurnameEn"] as String,
      PictureProfile: json["PictureProfile"] as String,
      EmailStudent: json["EmailStudent"] as String,
      mobile: json["Mobile"] as String,
      Address: json["Address"] as String,
      studentCode: json["StudentCode"] as String,
    );
  }
}
