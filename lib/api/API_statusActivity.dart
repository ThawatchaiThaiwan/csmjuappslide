import 'dart:io';
import 'package:appcsmju/APImodel/ActivitypostModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivityStatusService {
  /* final endPointUrl = "https://wwwdev.csmju.com/api/activitypic"; */

  

    static Future<List<ActivityPostmodel>>getstatusA() async {
      var emailget;
    SharedPreferences preferences = await SharedPreferences.getInstance();

    emailget = preferences.getString('email');
    var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
    Response res = await get(
      Uri.parse("https://wwwdev.csmju.com/api/activityjoin/email/$emailget"),

      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $authToken',
      },
    );

    if (res.statusCode == 200) {
      return activityPostmodelFromJson(res.body);
    }
    return getstatusA();
  }
}
