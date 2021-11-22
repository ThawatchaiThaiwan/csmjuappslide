import 'dart:convert';

import 'package:appcsmju/api/apinew.dart';

import 'package:appcsmju/controller/apinew_foot.dart';
import 'package:appcsmju/footbar/Calendar.dart';
import 'package:appcsmju/model/customListTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  ApiService client = ApiService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "ข่าว",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.keyboard_backspace),
          color: Colors.black,
        ),
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Apinew>> snapshot) {
          //let's check if we got a response or not
          if (snapshot.hasData) {
            //Now let's make a list of articles
            List<Apinew>? data = snapshot.data;
            return ListView.builder(
              //Now let's create our custom List tile
              itemCount: data!.length,
              itemBuilder: (context, index) =>
                  customListTile(data[index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
    
    
  }
}
