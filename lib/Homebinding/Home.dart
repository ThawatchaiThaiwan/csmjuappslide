import 'dart:html';

import 'package:appcsmju/model/carousel_loading.dart';
import 'package:appcsmju/controller/home_controller.dart';
import 'package:appcsmju/model/carousel_slider_data_found.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:appcsmju/api/remote_service.dart';

import 'package:appcsmju/api/apinew.dart';
import 'package:appcsmju/model/carousel_loading.dart';
// ignore: unused_import
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /* var url = (Uri.parse("https://wwwdev.csmju.com/api/news"));

  static var _dataFromAPI = [];
 
   Future<String> _getnews() async {
    //var url = Uri.parse("https://wwwdev.csmju.com/api/news");
    List<Widget>? _dataFromAPI;
    try {
      final response = await http.get(url);
      final jsonData = jsonDecode(response.body);
      print(response.body);

      setState(() {
        _dataFromAPI = jsonData;
      });
    } catch (err) {}
    //return apinewFromJson(response.body)[0].newsDetail;

    //_dataFromAPI = apinewFromJson(news.body) as Apinew;
    //print(jsonData);

    return "ok";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getnews();
  }  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[75],
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.people),
            color: Colors.black,
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_alert_sharp),
              color: Colors.black,
            ),
          ],
        ),
        body: SafeArea(
            child: SizedBox(
          width: 133,
          child: Text(
            "ข่าวประชาสัมพันธ์",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        )));

    //child: Text(_dataFromAPI?.newsDetail ?? "loadind..."),
  }

  @override
  // TODO: implement widget
  Widget _calasaul(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeController>(
        builder: (_c) {
          if (_c.isLoading) if (_c.carouselData.length > 0)
            return CarouselSliderDataFound(_c.carouselData);
          else
            return CarouselLoading();
          else if (_c.carouselData.length > 0)
            return CarouselSliderDataFound(_c.carouselData);
          else
            return Container();
        },
      ),
    );
  }
}
/* child: Text("ไอดีข่าว:${post["newsId"]} \n รายละเอียด:${post["News_Detail"]}"),
                        width: 206, */