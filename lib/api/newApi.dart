import 'dart:convert';
import 'dart:io';

import 'package:appcsmju/APImodel/carousel.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter/foundation.dart';

class APi {
  static final APi _singleton = new APi._internal();

  APi._internal();
  static APi get instance => _singleton;
  var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
  String baseUrl = "https://wwwdev.csmju.com/api/newsapp";
  //fbclid=IwAR1Jo1tkaAx7Jlk06VPdQQjLFg2pCWy-dXNkiM6DrSj2MViAwS_hiI4k-0U

  List<Apinews> li = [];
  Future<dynamic> GetNews(BuildContext context) async {
    //String authKey = 'News_Detail=app';
    var url = Uri.parse(baseUrl);
    http.Response response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $authToken',
      //"authKey": authKey
    });

    //print(data[0]);
    li.clear();

    var data = json.decode(response.body);

    data.forEach((value) {
      Apinews order = new Apinews.fromJson(value);
      li.add(order);
    });
   

    return data;

    // SuccessMessage("Order list", "Successfully Refreshed Order List", context);
  }
}
