// To parse this JSON data, do
//
//     final complain = complainFromJson(jsonString);

import 'dart:convert';



List<ReserveRoommodel> reserveRoommodelFromJson(String str) => 
List<ReserveRoommodel>.from(
  json.decode(str).map((x) => ReserveRoommodel.fromJson(x)));

/* String activityToJson(List<Activity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson()))); */



class ReserveRoommodel {
    ReserveRoommodel({
        required this.Classroom_Name,
        required this.Book_TimeStart,
        required this.Book_TimeEnd,
        required this.Book_Date,
        required this.Status_Book,
        required this.Book_Detail,
        required this.FirstName,
        required this.LastName,
        required this.StudentCode,
        required this.Email,
        required this.Adviser,

    });

    
    String Classroom_Name;
    String Book_TimeStart;
    String Book_TimeEnd;
    String Book_Date;
    String Status_Book;
    String Book_Detail;
    String FirstName;
    String LastName;
    String StudentCode;
    String Email;
    String Adviser;

    factory ReserveRoommodel.fromJson(Map<String, dynamic> json) {
      return ReserveRoommodel(
        Classroom_Name: json["Classroom_Name"],
        Book_TimeStart: json["Book_TimeStart"],
        Book_TimeEnd: json["Book_TimeEnd"],
        Book_Date: json["Book_Date"],
        Status_Book: json["Status_Book"],
        Book_Detail: json["Book_Detail"],
        FirstName: json["FirstName"],
        LastName: json["LastName"],
        StudentCode: json["StudentCode"],
        Email: json["Email"],
        Adviser: json["Adviser"],
      );
    }
    

    
}
