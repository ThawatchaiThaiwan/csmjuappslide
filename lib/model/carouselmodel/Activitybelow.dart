//Now let's create the article details page

// ignore_for_file: must_be_immutable

import 'package:appcsmju/APImodel/Activity.dart';
import 'package:appcsmju/APImodel/ActivitypostModel.dart';
import 'package:appcsmju/footbar/Foot.dart';
import 'package:appcsmju/footbar/Home.dart';
import 'package:appcsmju/model/activitymodel/listjoin.dart';
import 'package:appcsmju/post_api/postActivity.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Activitybelow extends StatefulWidget {
  const Activitybelow({Key? key, required this.article}) : super(key: key);
  //Activitybelow({required this.article});
  final Activity article;

  @override
  State<Activitybelow> createState() => _ActivitybelowState();
}

class _ActivitybelowState extends State<Activitybelow> {
  //ActivityPostmodel? _user;
  @override
  void initState() {
    _getUserInfo();

    super.initState();
  }

  final _formkey = GlobalKey<FormState>();
  var date;
  var userData;
  var name;
  var surname;
  var mobile;
  var email;
  var studentcode;
  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    /* var userJson = localStorage.getString('user');
    var user = json.decode(userJson!); */

    name = localStorage.getString('name');
    surname = localStorage.getString('surname');
    email = localStorage.getString('email');
    mobile = localStorage.getString('mobile');
    studentcode = localStorage.getString('Studentcode');
    //userData = user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          ' รายละเอียดโครงการ',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, fontFamily: 'Sarabun'),
        ),
        titleTextStyle: TextStyle(color: Colors.blueGrey[900]),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: Colors.blueGrey[900],
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : HomePageCarousel(),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_task_rounded,
              color: Colors.blueGrey[900],
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Listjoin()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //////////////////////////////////////////////////////////>>>>>>>รูปภาพ
                Container(
                  height: 245.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    //let's add the height
                    image: DecorationImage(
                        image: NetworkImage(widget.article.Activity_Picture),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Color(0xff24a878),
                      width: 2.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                /////////////////////////////////////////////////////////////>>>>>หัวข้อ
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    widget.article.Activity_Title,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      letterSpacing: 1.2,
                      color: Colors.blueGrey[900],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sarabun',
                    ),
                  ),
                ),
                Divider(
                  thickness: 3,
                  indent: 15,
                  endIndent: 15,
                  color: Color(0xff24a878),
                ),
                //////////////////////////////////////////////////////////>>>>>>.รายละเอียดโครงการ
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    "รายละเอียด",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      letterSpacing: 1.2,
                      color: Colors.blueGrey[900],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sarabun',
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    widget.article.Activity_Detail,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      letterSpacing: 0.98,
                      color: Colors.blueGrey[900],
                      fontSize: 18,
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'Sarabun',
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                ////////////////////////////////////////////////////////////////>>>>>>สถานที่จัดกิจกรรม
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    "สถานที่จัดกิจกรรม",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      letterSpacing: 1.2,
                      color: Colors.blueGrey[900],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sarabun',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    widget.article.Activity_Location,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      letterSpacing: 0.98,
                      color: Colors.blueGrey[900],
                      fontSize: 18,
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'Sarabun',
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                ///////////////////////////////////////////////////////////////>>>>>จัดกิจกรรมโดย
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    "จัดกิจกรรมโดย",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      letterSpacing: 1.2,
                      color: Colors.blueGrey[900],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sarabun',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    widget.article.Activity_Organizer,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      letterSpacing: 0.98,
                      color: Colors.blueGrey[900],
                      fontSize: 18,
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'Sarabun',
                    ),
                  ),
                ),

                SizedBox(
                  height: 8.0,
                ),
                ///////////////////////////////////////////////////////>>>>>>วันที่
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        // color: Colors.black,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "วันที่ : ",
                            style: TextStyle(
                              color: Colors.blueGrey[900],
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Sarabun',
                            ),
                          ),
                          Text(
                            widget.article.Activity_Start,
                            style: TextStyle(
                              color: Colors.blueGrey[900],
                              fontSize: 18,
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Sarabun',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "เวลา ",
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Sarabun',
                          ),
                        ),
                        Text(
                          widget.article.Activity_TimeStart,
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 18,
                            //fontWeight: FontWeight.bold,
                            fontFamily: 'Sarabun',
                          ),
                        ),
                        Text(
                          " น. ถึง ",
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Sarabun',
                          ),
                        ),
                        Text(
                          widget.article.Activity_TimeEnd,
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 18,
                            //fontWeight: FontWeight.bold,
                            fontFamily: 'Sarabun',
                          ),
                        ),
                        Text(
                          " น.",
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Sarabun',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  width: double.infinity,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xff24a878),
                    border: Border.all(
                      color: Colors.green,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x4f000000),
                        blurRadius: 3,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff24a878),
                    ),
                    onPressed: () {
                      setState(() async {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();

                          final String nameTh = name;
                          final String surnameTh = surname;
                          final String Email = email;
                          final String studentCode = studentcode;
                          final String Activity_Start =
                              widget.article.Activity_Start;
                          final String Status = "เข้าร่วมกิจกรรม";
                          final String Activity_Title =
                              widget.article.Activity_Title;

                          ///////////////////////////////////////////////////>>>>>>>>.post
                          final ActivityPostmodel? _user = await postactivity(
                            nameTh,
                            surnameTh,
                            Email,
                            studentCode,
                            Activity_Start,
                            Status,
                            Activity_Title,
                          );

                          ///////////////////////////////////////////////////>>>>>>>>.post
                          if (email != null) {
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.LEFTSLIDE,
                              headerAnimationLoop: false,
                              dialogType: DialogType.SUCCES,
                              showCloseIcon: true,
                              title: 'สำเร็จ',
                              btnOkText: 'ตกลง',
                              titleTextStyle: TextStyle(
                                color: Colors.blueGrey[900],
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              desc: 'ลงชื่อเข้าร่วมกิจกรรมสำเร็จ',
                              descTextStyle: TextStyle(
                                color: Colors.blueGrey[700],
                                fontSize: 18,
                              ),
                              btnOkColor: Color(0xff24a878),
                              btnOkOnPress: () {
                                Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => Foot(),
                                    ));
                              },
                              btnOkIcon: Icons.check_circle,
                              onDissmissCallback: (type) {
                                debugPrint(
                                    'Dialog Dissmiss from callback $type');
                              },
                            ).show();
                          }
                        }
                      });
                    },
                    child: Text(
                      'ลงชื่อเข้าร่วมกิจกรรม',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
