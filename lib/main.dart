import 'package:appcsmju/footbar/Another.dart';
import 'package:appcsmju/footbar/Calendar.dart';
import 'package:appcsmju/footbar/Foot.dart';
import 'package:appcsmju/model/loginmodel/login_page.dart';
import 'package:appcsmju/page/Appeal.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


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
        primaryColor: Colors.blueGrey,
        fontFamily: 'Sarabun',
        
        
        
      ),
      
      
      home:Foot() ,
    );
  }
}
