import 'dart:io';
import 'package:appcsmju/APImodel/BorrowReturnPostmodel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BorrowReturnStatusService {
  /* final endPointUrl = "https://wwwdev.csmju.com/api/activitypic"; */

  

    static Future<List<BorrowReturnPostmodel>>getstatusB() async {
      var emailget;
    SharedPreferences preferences = await SharedPreferences.getInstance();

    emailget = preferences.getString('email');
    var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
    Response res = await get(
      Uri.parse("https://wwwdev.csmju.com/api/borrow_return/$emailget"),

      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $authToken',
      },
    );

    if (res.statusCode == 200) {
      return borrowReturnPostmodelFromJson(res.body);
    }
    return getstatusB();
  }
}
