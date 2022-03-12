// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:io';
import 'package:appcsmju/page/Profile/Edit_profile.dart';
import 'package:http/http.dart' as http;
import 'package:appcsmju/footbar/Another.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var userData;
  var name;
  var surname;
  var mobile;
  var email;
  var studentcode;
  ////////////////
  var nameEN;
  var surnameEN;
  var address;
  /* var fromCh = null; */
  /* var profile; */
  var ID;
  //var phone;
  var image;

  @override
  void initState() {
    _getUserInfo();
    findUser();
    super.initState();
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    /* var userJson = localStorage.getString('user');
    var user = json.decode(userJson!); */
    setState(() {
      name = localStorage.getString('name');
      surname = localStorage.getString('surname');
      email = localStorage.getString('email');
      mobile = localStorage.getString('mobile');
      studentcode = localStorage.getString('Studentcode');
    });
  }

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
    //print(getuser);
    var user = getuser['data'];
    //print(user);
    for (var dataStudent in user) {
      print(dataStudent);
      if (nameEN?.isnotEmpty ?? true) {
        setState(() {
          ID = dataStudent['studentId'];
          name = dataStudent["nameTh"];
          surname = dataStudent["surnameTh"];
          nameEN = dataStudent["nameEn"];
          surnameEN = dataStudent["surnameEn"];
          email = dataStudent["EmailStudent"];
          mobile = dataStudent["mobile"];
          address = dataStudent["Address"];
          image = dataStudent["PictureProfile"];
          studentcode = dataStudent["studentCode"];
          /* print(name);
          print(surname);
          print(nameEN);
          print(surnameEN);
          print(email);
          print(mobile);
          print(address);
          print(image);
          print(studentcode);
          print(ID); */
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              ///////////////////////////////////////////////////////////รูปใหญ่
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      image == null
                          ? 'https://wwwdev.csmju.com/images/news/thumbnail/no_img.jpg'
                          : image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16, 200, 16, 16),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[800],
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 96.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //////////////////////////////////////////////////////////ชื่อ นามสกุล
                                    Text('$name $surname',
                                        style: TextStyle(
                                            fontSize: 26.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                            textBaseline:
                                                TextBaseline.alphabetic,
                                            fontFamily: 'Sarabun')),
                                    ListTile(
                                      ///////////////////////////////////////////////////////////รหัสนักศึกษา
                                      contentPadding: EdgeInsets.all(0),
                                      title: Text('$studentcode',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Sarabun',
                                          )),
                                          ////////////////////////////////////////////////////////////อีเมลบน
                                      subtitle: Text('$email',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Sarabun',
                                          )),
                                    )
                                  ]),
                            ),
                            SizedBox(height: 10.0),
                          ],
                        ),
                      ),
                      ///////////////////////////////////////////////////รูปเล็ก
                      Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              image == null
                                  ? 'https://wwwdev.csmju.com/images/news/thumbnail/no_img.jpg'
                                  : image,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: EdgeInsets.only(left: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[600],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          
                            Expanded(
                              child: ListTile(
                                /////////////////////////////////////////////////////ข้อมูลผู้ใช้
                                title: Text(
                                  'ข้อมูลผู้ใช้',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Sarabun',
                                  ),
                                ),
                              ),
                            ),
                            Flexible( 
                              child: IconButton(
                                icon: Icon(Icons.edit,
                                    color: Colors.white, size: 20),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditProfile(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          
                        ]),

                        //////////////////////////////////////////////////////ชื่อ-นามสกุล
                        Divider(color: Colors.white,),
                        ListTile(
                          title: Text(
                            'ชื่อ - นามสกุล (อังกฤษ)',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Sarabun',
                            ),
                          ),
                          subtitle: Text(
                            '$nameEN $surnameEN',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Sarabun',
                            ),
                          ),
                          leading: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        /////////////////////////////////////////////////////Email
                        ListTile(
                          title: Text(
                            'อีเมล',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Sarabun',
                            ),
                          ),
                          subtitle: Text(
                            '$email',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Sarabun',
                            ),
                          ),
                          leading: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                        ),
                        /////////////////////////////////////////////////////////เบอร์โทร
                        ListTile(
                          title: Text(
                            'เบอร์โทรศัพท์',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Sarabun',
                            ),
                          ),
                          subtitle: Text(
                            '$mobile',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Sarabun',
                            ),
                          ),
                          leading: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                        ),
                        /////////////////////////////////////////////////////////ที่อยู่
                        ListTile(
                          title: Text(
                            'ที่อยู่',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Sarabun',
                            ),
                          ),
                          subtitle: Text(
                            '$address',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Sarabun',
                            ),
                          ),
                          leading: Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ///////////////////////////////////////////////////////////
                ],
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Navigator.canPop(context)
                  ? IconButton(
                      icon: Icon(
                        Icons.keyboard_backspace,
                        color: Colors.blueGrey[900],
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  : Another(),
            ),
          ],
        ),
      ),
    );
  }
}
