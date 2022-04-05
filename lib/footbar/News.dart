import 'dart:convert';
import 'dart:io';

import 'package:appcsmju/APImodel/apinew.dart';
import 'package:appcsmju/api/apinew_foot.dart';
import 'package:appcsmju/model/newsmodel/customListTile.dart';
import 'package:appcsmju/page/notifications/notifications.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../page/Profile/Profile.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  void initState() {
    super.initState();

    findUser();
  }

  ApiService client = ApiService();
  var ID;
  var image;
  var studentcode;
//////////////////////////////////////////////////////////////////////>>>>>>>>get user
  //ProfileP? profileP;
  Future<dynamic> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    studentcode = preferences.getString('Studentcode');
    var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
    var response = await http.get(
      Uri.parse("https://wwwdev.csmju.com/api/student/$studentcode"),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $authToken',
      },
    );
    var getuser = json.decode(response.body);
    var user = getuser['data'];
    print(user);
    for (var dataStudent in user) {
      setState(() {
        image = dataStudent['PictureProfile'];
      });

      print(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            
           Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Profile();
            }));
          },
          child: ClipRRect(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: new BoxDecoration(
                      border: Border.all(
                          width: 2.5,
                          color: Color(0xff24a878)),
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: new NetworkImage(image == null
                              ? 'https://wwwdev.csmju.com/images/news/thumbnail/no_img.jpg'
                              : image)))),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "ข่าวสาร",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blueGrey[900],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Notifications();
              }));
            },
            
            icon: Icon(
              Icons.notifications,
              color: Colors.blueGrey[800],
            ),
          )
        ],
      ),
      body: FutureBuilder(
        ///////////////////////////////////////////////////////////>>>>>>>>>>แสดงหน้าข่าว
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Apinew>> snapshot) {
          if (snapshot.hasData) {
            List<Apinew>? data = snapshot.data;
            return SingleChildScrollView(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                shrinkWrap: true,
                reverse: true,
                itemCount: data!.length,
                itemBuilder: (context, index) =>
                    customListTile(data[index], context),
              ),
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
