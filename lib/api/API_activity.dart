import 'dart:io';

import 'package:appcsmju/APImodel/Activity.dart';
import 'package:http/http.dart';


class ActivityApiService {
  
  /* final endPointUrl = "https://wwwdev.csmju.com/api/activitypic"; */
 


 static Future<List<Activity>> getsActivity() async {
    var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
    Response res = await get(Uri.parse("https://wwwdev.csmju.com/api/activity"),headers: {
      HttpHeaders.authorizationHeader: 'Bearer $authToken',
    },);


     if(res.statusCode == 200){ 
        return activityFromJson(res.body);
      }
      return getsActivity();
    
    
  }
}
