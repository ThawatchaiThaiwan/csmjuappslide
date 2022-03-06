/* // To parse this JSON data, do
//
//

import 'dart:convert';

List<ProfileP> profilePFromJson(String str) => List<ProfileP>.from(json.decode(str).map((x) => ProfileP.fromJson(x)));

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
    
  });

  factory ProfileP.fromJson(Map<String, dynamic> json) {
    return ProfileP(
      studentId: json["StudentId"] ,
      nameTh: json["NameTh"] ,
      surnameTh: json["SurnameTh"] ,
      nameEn: json["NameEn"] ,
      surnameEn: json["SurnameEn"] ,
      PictureProfile: json["PictureProfile"] ,
      EmailStudent: json["EmailStudent"] ,
      mobile: json["Mobile"] ,
      Address: json["Address"] ,
      studentCode: json["StudentCode"] ,
    );
  }
}
 */