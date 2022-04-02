
import 'dart:convert';

import 'package:appcsmju/APImodel/ActivitypostModel.dart';
import 'package:http/http.dart' as http;


  Future<ActivityPostmodel?> postactivity(
    String nameTh,
    String surnameTh,
    String Email,
    String studentCode,
    String Activity_Start,
    String Status,
    String Activity_Title,
    
    



     
  ) async {
    var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
    String Url = 'https://wwwdev.csmju.com/api/activityjoin/create';
    var response = await http.post(Uri.parse(Url),
          headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken'
    },
    body: jsonEncode(<String, String >{
      'nameTh': nameTh,
      'surnameTh': surnameTh,
      'Email': Email,
      'studentCode': studentCode,
      'Activity_Start': Activity_Start,
      'Status': Status,
      'Activity_Title': Activity_Title,
      
      
    }),
         
         
     );
      if (response.statusCode == 500) {
        print("put success");
        
      } else {
        var messageError = "Can not post !!";
        print(messageError);
        print(response.statusCode);
      }
      return null;
      
  }

