import 'dart:convert';
import 'dart:ui';

import 'package:appcsmju/APImodel/Borrowmodel.dart';
import 'package:appcsmju/footbar/Another.dart';
import 'package:appcsmju/footbar/Foot.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dio/dio.dart';

import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Borrowreturn extends StatefulWidget {
  @override
  _BorrowreturnState createState() => _BorrowreturnState();
}

class _BorrowreturnState extends State<Borrowreturn> {
  @override
  void initState() {
    _getUserInfo();
    //equipment();
    super.initState();
  }

////////////////////////////////////////////////////////////////////////////localstorege
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
    setState(() {
      name = localStorage.getString('name');
      surname = localStorage.getString('surname');
      email = localStorage.getString('email');
      mobile = localStorage.getString('mobile');
      studentcode = localStorage.getString('Studentcode');
      //userData = user;
    });
  }

  ///////////////////////////////////////////////////////////////////>>>>>> textcontroller
  TextEditingController _EquipmenController = TextEditingController();
  TextEditingController _DatefristController = TextEditingController();
  TextEditingController _DatereturnController = TextEditingController();
  TextEditingController _NoteController = TextEditingController();

  ///
  var countriesKey = GlobalKey<FindDropdownState>();
  var nameKey = GlobalKey<FindDropdownState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'ยืม - คืน',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blueGrey[900],
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              fontFamily: 'Sarabun'),
        ),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: Colors.blueGrey[900],
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : Another(),
        actions: [
          IconButton(
            onPressed: () {
              /* Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListReserve())); */
            },
            icon: Icon(
              Icons.repeat,
              color: Colors.blueGrey[900],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            width: double.infinity,
            height: 650,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Color(0xffd1cccc),
                width: 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                FindDropdown<Borrowbackmodel>(
                  key: nameKey,
                  label: 'ค้นหาอุปกรณ์',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey[900],
                    fontSize: 20,
                    fontFamily: 'Sarabun',
                    fontWeight: FontWeight.bold,
                  ),
                  onFind: (String where) => getData(where),
                  searchBoxDecoration: InputDecoration(
                      hintText: "ชื่ออุปกรณ์", border: OutlineInputBorder()),
                  onChanged: (Borrowbackmodel? item) => print(item),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "วันที่ยืม",
                        style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 20,
                            fontFamily: 'Sarabun',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "วันที่คืน",
                        style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 20,
                            fontFamily: 'Sarabun',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: DateTimePicker(
                        initialValue: '',
                        dateMask: 'd MMM, yyyy',
                        smartDashesType: SmartDashesType.disabled,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        dateLabelText: 'เลือกวันที่ยืม',
                        onChanged: (val) => print(val),
                        validator: (val) {
                          setState(() {
                            date = DateFormat.yMd(val);
                            _DatefristController.text = date.toString();
                          });
                          print(date);
                          return null;
                        },
                        onSaved: (val) => print(val),
                        style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 18,
                            fontFamily: 'Sarabun',
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: DateTimePicker(
                        initialValue: '',
                        dateMask: 'd MMM, yyyy',
                        smartDashesType: SmartDashesType.disabled,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        dateLabelText: 'เลือกวันที่คืน',
                        onChanged: (val) => print(val),
                        validator: (val) {
                          setState(() {
                            date = DateFormat.yMd(val);
                            _DatefristController.text = date.toString();
                          });
                          print(date);
                          return null;
                        },
                        onSaved: (val) => print(val),
                        style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 18,
                            fontFamily: 'Sarabun',
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "ชื่อ-นามสกุล",
                    style: TextStyle(
                        color: Colors.blueGrey[900],
                        fontSize: 20,
                        fontFamily: 'Sarabun',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  //margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black87),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 3,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "$name $surname",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.blueGrey[900],
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "email",
                    style: TextStyle(
                        color: Colors.blueGrey[900],
                        fontSize: 20,
                        fontFamily: 'Sarabun',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  //margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black87),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 3,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "$email",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.blueGrey[900],
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "*หมายเหตุ",
                    style: TextStyle(
                        color: Colors.blueGrey[900],
                        fontSize: 20,
                        fontFamily: 'Sarabun',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  //margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 48,
                  width: double.infinity,
                  //color: Colors.blueGrey[100],
                  decoration: BoxDecoration(
                    //color: Colors.blueGrey[200],
                    borderRadius: BorderRadius.circular(5),
                    /* border: Border.all(color: Colors.blueGrey),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 3,
                        offset: Offset(0, 4),
                      )
                    ], */
                  ),
                  child: TextFormField(
                    controller: _NoteController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'หมายเหตุ',
                      hintStyle: TextStyle(
                        color: Colors.blueGrey[900],
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text("*กรุณาคืนของที่ยืมให้ตรงตามกำหนด",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sarabun',
                        fontStyle: FontStyle.italic,
                      )),
                ),

                SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green[700],
                    border: Border.all(
                      color: Color(0xff24a878),
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
                      /* setState(() async {
                              if (formkey.currentState!.validate()) {
                                formkey.currentState!.save();

                                final String Classroom_Name =
                                    _roomController.text;
                                final String Book_TimeStart =
                                    _TimefristController.text;
                                final String Book_TimeEnd =
                                    _TimeendController.text;
                                final String Book_Detail =
                                    _DeteilController.text;
                                final String FirstName = name;
                                final String LastName = surname;
                                final String StudentCode = studentcode;
                                final String Email = email;
                                final String Adviser = _AdviserController.text;
                                final String Book_Status = 'รอการอนุมัติ';
                                final String Book_Date =
                                    DateFormat('dd-MM-yyyy')
                                        .format(DateTime.now());

                                ///////////////////////////////////////////////////>>>>>>>>.post
                                final ReserveRoommodel? _user =
                                    await postReserveRoom(
                                        Classroom_Name,
                                        Book_TimeStart,
                                        Book_TimeEnd,
                                        Book_Detail,
                                        FirstName,
                                        LastName,
                                        StudentCode,
                                        Email,
                                        Adviser,
                                        Book_Status,
                                        Book_Date);

                                ///////////////////////////////////////////////////>>>>>>>>.post

                                if (_DeteilController.text.isNotEmpty) {
                                  showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title: const Text('แจ้งเตือน'),
                                            content:
                                                const Text('แจ้งตกค้างสำเร็จ'),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text(
                                                  'ตกลง',
                                                  textAlign: TextAlign.center,
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            Foot(),
                                                      ));
                                                },
                                              ),
                                            ],
                                          ));
                                }
                              }
                            }); */
                    },
                    child: Text(
                      'ยืนยันการยืม',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ///////////////////////////////////////////////////>>>>>>>ปุ่มยกเลิก
                SizedBox(height: 20.0),
                Container(
                  width: double.infinity,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.red[10],
                    border: Border.all(
                      color: Color(0xd3e74949),
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
                      primary: Colors.red[400],
                    ),
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text(
                      'ยกเลิก',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List<Borrowbackmodel>> getData(where) async {
    var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
    var response = await Dio().get(
      "https://wwwdev.csmju.com/api/newsapp",
      queryParameters: {"where": where},
      options: Options(
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $authToken',
        },
      ),
    );

    var models = Borrowbackmodel.fromJsonList(response.data);
    return models;
  }
}
/* FindDropdown<Borrowbackmodel>(
                            label: "Nome",
                            onFind: (String filter) async {
                              var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
                              var response = await Dio().get(
                                "https://wwwdev.csmju.com/api/equipment",
                                queryParameters: {"filter": filter},
                              );
                              print(response.data);
                              options : Options(
                                headers: {
                                  'Authorization': 'Bearer $authToken',
                                },
                              );
                              var models =
                                  Borrowbackmodel.fromJsonList(response.data);
                              return models;
                            },
                            onChanged: (Borrowbackmodel? data) {
                              
                            },
                          ), */