

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:appcsmju/APImodel/Residuemodel.dart';
import 'package:http/http.dart' as http;
  
   var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';

  Future<Residues?> POSTResidue(
    String Subject_Internal,
    String Subject_External,
    String Residaual_Detail,
    String nameTh,
    String surnameTh,
    String EmailStudent,
    String mobile,
    String studentCode,
    String Sec_Internal, 
    String Sec_Another,
    String Subject60,
    

  ) async {
  final response = await http.post(
    Uri.parse('https://wwwdev.csmju.com/api/residaual/create'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken'
    },
    body: jsonEncode(<String, String >{
      'Subject_Internal': Subject_Internal,
      'Subject_External': Subject_External,
      'Residaual_Detail': Residaual_Detail,
      'nameTh': nameTh,
      'surnameTh': surnameTh,
      'EmailStudent': EmailStudent,
      'mobile': mobile,
      'studentCode': studentCode,
      'Sec_Internal': Sec_Internal,
      'Sec_Another': Sec_Another,
      'Subject60': Subject60,
      
    }),
  );

  if (response.statusCode == 201) {
    return Residues.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post.');
  }
}
