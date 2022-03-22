
import 'dart:convert';

import 'package:appcsmju/APImodel/ReserveRoommodel.dart';
import 'package:http/http.dart' as http;


  Future<ReserveRoommodel?> postReserveRoom(
    String Classroom_Name,
    String Book_TimeStart,
    String Book_TimeEnd,
    String Book_Detail,
    String FirstName,
    String LastName,
    String StudentCode,
    String Email,
    String Adviser,
    String Status_Book,
    String Book_Date,




     
  ) async {
    var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
    String Url = 'https://wwwdev.csmju.com/api/bookclassroom/create';
    var response1 = await http.post(Uri.parse(Url),
          headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken'
    },
    body: jsonEncode(<String, String >{
      'Classroom_Name': Classroom_Name,
      'Book_TimeStart': Book_TimeStart,
      'Book_TimeEnd': Book_TimeEnd,
      'Book_Date': Book_Date,
      'Status_Book': Status_Book,
      'Book_Detail': Book_Detail,
      'FirstName': FirstName,
      'LastName': LastName,
      'StudentCode': StudentCode,
      'Email': Email,
      'Adviser': Adviser,
      
    }),
         
         
     );
      if (response1.statusCode == 200) {
        print("put success");
        
      } else {
        var messageError = "Can not post !!";
        print(messageError);
        print(response1.statusCode);
      }
      
  }

