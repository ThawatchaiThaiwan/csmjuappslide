import 'package:appcsmju/APImodel/login_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class APIService {
  dynamic url = "https://www.digital.mju.ac.th/api/login/mju/ad";
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    /* Options(headers: <String, String>{
      'Authorization': 'Bearer $authToken',
    }); */
    final response =
        await http.post(Uri.parse(url), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  postData(data, apiUrl) async {
        var fullUrl =  Uri.parse(url + apiUrl+ await _getToken()) ;
        return await http.post(
            fullUrl, 
            body: jsonEncode(data), 
            headers: _setHeaders()
        );
    }
  /* getData(apiUrl) async {
       var fullUrl =  Uri.parse(url + apiUrl+ await _getToken()) ;
       return await http.get(
         fullUrl, 
         headers: _setHeaders()
       );
    } */




    _setHeaders() => {
        'Content-type' : 'application/json',
        'Accept' : 'application/json',
    };

    _getToken() async {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        var access_token = localStorage.getStringList('access_token') as String;
        return '?access_token= $access_token';
    }

  /* getData(String s) {} */
}