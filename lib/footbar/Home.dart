

import 'package:appcsmju/Homebinding/HomeCarousel.dart';
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

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);
  @override
  GlobalKey key = new GlobalKey();
  _HomePageState createState() => _HomePageState();
  int currentTab = 0;
  final List<Widget> screens = [
    HomeCarousel(),
  ];
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    HomeCarousel screens;
    return Scaffold(
        backgroundColor: Colors.grey[75],
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
            color: Colors.black, //ยังไม่ได้เชื่อปุ่ม icons
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_active),
              color: Colors.black,
            ),
          ],
        ),
        body: Container(
          child : screens = HomeCarousel(),
          )
        );
        
  }
}
//(child : screens = HomeCarousel(),)

