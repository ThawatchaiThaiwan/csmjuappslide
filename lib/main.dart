import 'package:appcsmju/footbar/Foot.dart';
import 'package:appcsmju/model/loginmodel/login_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: debugPrintBeginFrameBanner,
      title: 'CSMJU APP',
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: 'Sarabun',
        
      ),
      home:Foot() ,
    );
  }
}
