import 'dart:convert';
import 'dart:io';
import 'package:appcsmju/page/Borrowreturn.dart/Borrow_back.dart';
import 'package:appcsmju/page/ReserveRoom/ReserveRoom.dart';
import 'package:appcsmju/page/notifications/notifications.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;

import 'package:appcsmju/api/apinew_foot.dart';
import 'package:appcsmju/model/loginmodel/login_page.dart';
import 'package:appcsmju/page/Activityanoter.dart';
import 'package:appcsmju/page/Appeal.dart';

import 'package:appcsmju/page/Profile/Profile.dart';

import 'package:appcsmju/page/Residue.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Another extends StatefulWidget {
  const Another({Key? key}) : super(key: key);

  @override
  _AnotherState createState() => _AnotherState();
}

int curenttap = 0;
Color _color = Colors.blueGrey;

class _AnotherState extends State<Another> {
  @override
  void initState() {
    super.initState();

    findUser();
  }

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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Profile()));
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
          "บริการอื่นๆ",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Column(children: [
            //////////////////////////////////////////////////////////////////>>>>>.ข้อมูลส่วนตัว
            Card(
              elevation: 4,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.perm_identity_rounded,
                        color: Colors.blueGrey[900],
                        size: 22,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "ข้อมูลส่วนตัว",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[900]),
                      ),
                      Expanded(
                          child: ListTile(
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.blueGrey[900],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),

            ///////////////////////////////////////////////////////////>>>>แจ้งตกค้าง
            Card(
              elevation: 4,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Residue()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.mail_outline_sharp,
                        color: Colors.blueGrey[900],
                        size: 22,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "แจ้งรายวิชาตกค้าง",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[900]),
                      ),
                      Expanded(
                          child: ListTile(
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.blueGrey[900],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            /////////////////////////////////////////////////////////>>>>>.ยืมคืน
            Card(
              elevation: 4,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Appeal()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.comment_outlined,
                        color: Colors.blueGrey[900],
                        size: 22,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "ติดต่อหลักสูตร",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[900]),
                      ),
                      Expanded(
                          child: ListTile(
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.blueGrey[900],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            ///////////////////////////////////////////////////////////>>>>>>ยืมคืน
            Card(
              elevation: 4,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Borrowreturn()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.real_estate_agent_outlined,
                        color: Colors.blueGrey[900],
                        size: 22,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "ยืมคืน",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[900]),
                      ),
                      Expanded(
                          child: ListTile(
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.blueGrey[900],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            ///////////////////////////////////////////////////////////////>>>>>จองห้องเรียน

            Card(
              elevation: 4,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ReserveRoom1()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.book_outlined,
                        color: Colors.blueGrey[900],
                        size: 22,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "จองห้องเรียน",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[900]),
                      ),
                      Expanded(
                          child: ListTile(
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.blueGrey[900],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            ////////////////////////////////////////////////////////>>>>>.โครงการทั้งหมด
            Card(
              elevation: 4,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ActivityAnoter()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.library_books_outlined,
                        color: Colors.blueGrey[900],
                        size: 22,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "โครงการทั้งหมด",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[900]),
                      ),
                      Expanded(
                          child: ListTile(
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.blueGrey[900],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),

            //////////////////////////////////////////////////////>>>>>>.ออกจากระบบ

            Card(
              elevation: 4,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.QUESTION,
                    headerAnimationLoop: false,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'ต้องการออกจากระบบหรือไม่?',
                    //desc: 'Dialog description here...',
                    buttonsTextStyle: const TextStyle(color: Colors.black),
                    showCloseIcon: true,
                    btnCancelColor: Color(0xd3e74949),
                    btnOkColor: Color(0xff24a878),
                    btnCancelText: 'ยกเลิก',
                    btnOkText: 'ตกลง',
                    btnCancelOnPress: () {
                      debugPrint('OnClcik');
                    },
                    btnOkOnPress: () {
                      logout();
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => LoginPage(),
                          ));
                    },
                  ).show();
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.login_outlined,
                        color: Colors.blueGrey[900],
                        size: 22,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "ออกจากระบบ",
                        style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[900]),
                      ),
                      Expanded(
                          child: ListTile(
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.blueGrey[900],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            )
          ]
              /* gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10) */
              ),
        ),
      ),
    );
  }

  void logout() async {
    // logout from the server ...
    var res = await ApiService().getData('logout');
    var name;
    var surname;
    var mobile;
    var email;
    var Studentcode;
    //var body = json.decode(res.body);
    //if (body['success']) {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('access_token');
    localStorage.remove('name');
    localStorage.remove('surname');
    localStorage.remove('mobile');
    localStorage.remove('email');
    localStorage.remove('Studentcode');
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => LoginPage()));
    // }
  }
}
