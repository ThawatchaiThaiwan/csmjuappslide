// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:appcsmju/APImodel/Profilemodel.dart';
import 'package:appcsmju/APImodel/Residuemodel.dart';
import 'package:http/http.dart' as http;

var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';

Future<ProfileP?> POSTProfile(
  String nameTh,
  String surnameTh,
  String nameEn,
  String surnameEn,
  String PictureProfile,
  String EmailStudent,
  String mobile,
  String Address,
  String studentCode,
) async {
  if (nameEn.isNotEmpty &&
      surnameEn.isNotEmpty &&
      PictureProfile.isNotEmpty &&
      mobile.isNotEmpty &&
      Address.isNotEmpty) {
    final response = await http.post(
      Uri.parse('https://wwwdev.csmju.com/api/student'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken'
      },
      body: jsonEncode(<String, String>{
        'nameTh': nameTh,
        'surnameTh': surnameTh,
        'nameEn': nameEn,
        'surnameEn': surnameEn,
        'PictureProfile': PictureProfile,
        'EmailStudent': EmailStudent,
        'mobile': mobile,
        'Address': Address,
        'studentCode': studentCode,
      }),
    );
    /* if (response.statusCode == 200) {
      var messageSuccess = json.decode(response.body)['message'];
      showMessage(context, messageSuccess);
    } else {
      var messageError = "Can not Post this user!!";
      showMessage(context, messageError);
    } */

    nameEn.isNotEmpty &&
        surnameEn.isNotEmpty &&
        PictureProfile.isNotEmpty &&
        mobile.isNotEmpty &&
        Address.isNotEmpty;
    final res = await http.put(
      Uri.parse('https://wwwdev.csmju.com/api/student/where/studentCode/eq/$studentCode'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken'
      },
      body: jsonEncode(<String, String>{
        'nameTh': nameTh,
        'surnameTh': surnameTh,
        'nameEn': nameEn,
        'surnameEn': surnameEn,
        'PictureProfile': PictureProfile,
        'EmailStudent': EmailStudent,
        'mobile': mobile,
        'Address': Address,
        'studentCode': studentCode,
      }),
    );

    final resp = await http.post(
      Uri.parse('https://wwwdev.csmju.com/api/student'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken'
      },
      body: jsonEncode(<String, String>{
        'studentId': studentCode,
        'nameTh': nameTh,
        'surnameTh': surnameTh,
        'nameEn': nameEn,
        'surnameEn': surnameEn,
        'PictureProfile': PictureProfile,
        'EmailStudent': EmailStudent,
        'mobile': mobile,
        'Address': Address,
        'studentCode': studentCode,
      }),
    );

    /* if (response.statusCode == 201) {
    return Residues.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post.');
  } */
  }
}
