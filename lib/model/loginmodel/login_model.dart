import 'dart:convert';


import 'package:appcsmju/model/loginmodel/apilogin.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  Future<http.Response> login(String email, String password) async {
    Map<String,dynamic> data = {
      "email": email,
      "password": password,
    };
    
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'login');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }
}