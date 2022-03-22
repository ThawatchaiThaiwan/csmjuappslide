// To parse this JSON data, do
//
//     final complain = complainFromJson(jsonString);

import 'dart:convert';



List<BorrowReturnPostmodel> borrowReturnPostmodelFromJson(String str) => List<BorrowReturnPostmodel>.from(json.decode(str).map((x) => BorrowReturnPostmodel.fromJson(x)));

/* String activityToJson(List<Activity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson()))); */



class BorrowReturnPostmodel {
    BorrowReturnPostmodel({
        required this.borrow_returnId,
        required this.Equipment_Name,
        required this.Borrow_Date,
        required this.Borrow_Details,
        required this.Return_Date,
        required this.Status,
        required this.FirstName,
        required this.LastName,
        required this.Email,
        

    });

    
    int borrow_returnId;
    String Equipment_Name;
    String Borrow_Date;
    String Borrow_Details;
    String Return_Date;
    String Status;
    String FirstName;
    String LastName;
    String Email;
    

    factory BorrowReturnPostmodel.fromJson(Map<String, dynamic> json) {
      return BorrowReturnPostmodel(
        borrow_returnId: json["Classroom_Name"],
        Equipment_Name: json["Book_TimeStart"],
        Borrow_Date: json["Book_TimeEnd"],
        Borrow_Details: json["Book_Date"],
        Return_Date: json["Status_Book"],
        Status: json["Book_Detail"],
        FirstName: json["FirstName"],
        LastName: json["LastName"],
        Email: json["StudentCode"],
        
      );
    }
    

    
}
