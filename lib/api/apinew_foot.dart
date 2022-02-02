import 'dart:io';

import 'package:appcsmju/APImodel/apinew.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
  final endPointUrl = "https://wwwdev.csmju.com/api/newsapp";

  

  Future<List<Apinew>> getArticle() async {
    
    /* Map<String, String>  headers = {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $authToken',
    }; */
    Response res = await http.get(Uri.parse(endPointUrl), 
    headers: {
      HttpHeaders.authorizationHeader: 'Bearer $authToken',
    },
    
    );

    if (res.statusCode == 200) {
      return apinewFromJson(res.body);
    }
    return getArticle();
  }

  getData(String s) {}

  postData(Map<String, String> data, String s) {}
}
