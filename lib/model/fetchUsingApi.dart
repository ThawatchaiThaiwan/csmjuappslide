import 'dart:convert';

import 'package:appcsmju/model/carousel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter/foundation.dart';


class APi{
  static final APi _singleton = new APi._internal();

  APi._internal();
  static APi get instance => _singleton;
  String baseUrl="https://wwwdev.csmju.com/api/newsapp";
  //fbclid=IwAR1Jo1tkaAx7Jlk06VPdQQjLFg2pCWy-dXNkiM6DrSj2MViAwS_hiI4k-0U

List<Apinew> li=[];
  Future<dynamic> GetNews(BuildContext context) async {
    String authKey = 'News_Detail=app';
    var url = Uri.parse(baseUrl);
    http.Response response = await http.get(url, headers: {"authKey": authKey});

    //print(data[0]);
    li.clear();

//print(data);

    var data=json.decode(response.body);
    var new1=data;

    data.forEach((value) {
      Apinew order = new Apinew.fromJson(value);
      li.add(order);
    });
    print('API GET');


    return data;


    // SuccessMessage("Order list", "Successfully Refreshed Order List", context);


  }

}