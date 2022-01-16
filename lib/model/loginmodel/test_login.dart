import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class CallApi{
    final String _url = "https://www.digital.mju.ac.th/api/login/mju/ad";

    postData(data, apiUrl) async {
        var fullUrl =  Uri.parse(_url + apiUrl+ await _getToken()) ;
        return await http.post(
            fullUrl, 
            body: jsonEncode(data), 
            headers: _setHeaders()
        );
    }
    getData(apiUrl) async {
       var fullUrl =  Uri.parse(_url + apiUrl+ await _getToken()) ;
       return await http.get(
         fullUrl, 
         headers: _setHeaders()
       );
    }




    _setHeaders() => {
        'Content-type' : 'application/json',
        'Accept' : 'application/json',
    };

    _getToken() async {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        var access_token = localStorage.getStringList('access_token') as String;
        return '?access_token= $access_token';
    }
}