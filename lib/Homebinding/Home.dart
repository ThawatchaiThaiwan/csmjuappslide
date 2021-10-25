import 'package:appcsmju/footbar/Foot.dart';
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

@override
// ignore: override_on_non_overriding_member
Widget builds(BuildContext context) {
  return Scaffold(
    appBar: AppBar(),
  );
}

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);
  @override
  GlobalKey key = new GlobalKey();
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          child: GetBuilder<HomeController>(
            builder: (_c) {
              if (_c.isLoading) if (_c.carouselData.length > 0)
                return CarouselSliderDataFound(_c.carouselData);
              else
                return CarouselLoading();
              else if (_c.carouselData.length > 0)
                return CarouselSliderDataFound(_c.carouselData);
              else
                return Foot();
                
            },
          ),
        )
        
        );

    //child: Text(_dataFromAPI?.newsDetail ?? "loadind..."),
  }

 
  }


/* child: Text("ไอดีข่าว:${post["newsId"]} \n รายละเอียด:${post["News_Detail"]}"),
                        width: 206, */