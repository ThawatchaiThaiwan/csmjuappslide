import 'dart:convert';
import 'dart:async';

import 'package:appcsmju/APImodel/Residuemodel.dart';
import 'package:appcsmju/footbar/Another.dart';
import 'package:appcsmju/post_api/ResiduePost.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Residue extends StatefulWidget {
  @override
  _ResidueState createState() => _ResidueState();
}

class _ResidueState extends State<Residue> {
  ///////////////////////////////////////////////////////////////////>>>>>>>.dropdown list group
  String? Groupvalue;

  var groups = [
    'กลุ่มที่ 1',
    'กลุ่มที่ 2',
    'กลุ่มที่ 3',
  ];

////////////////////////////////////////////////////////////////////////////////// api dropdpw

  List? subject_data;
  String? subjectid;
  var url = Uri.encodeFull('https://wwwdev.csmju.com/api/subject');
  Future<String> country() async {
    var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
    var res = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      'Authorization': 'Bearer $authToken',
    }); //if you have any auth key place here...properly..
    var resBody = json.decode(res.body);

    setState(() {
      subject_data = resBody;
    });

    return "Sucess";
  }

/////////////////////////////////////////////////////////////////////>>>>>> validate

  bool _validate1 = false;
  bool _validate2 = false;
  bool _validate3 = false;
  bool _validate4 = false;
  bool _validate5 = false;
  bool _validate6 = false;
  bool _validate7 = false;
  bool _validate8 = false;
  bool _validate9 = false;

////////////////////////////////////////////////////////////////////////////////////

  @override
  void initState() {
    _getUserInfo();
    //DateController2.text = "";
    super.initState();
    this.country();
  }

  /////////////////////////////////////////////////////////////////////>>>>>>>. post
  Residues? _user;

  ///////////////////////////////////////////////////////////////////>>>>>>>>>controller

  TextEditingController StudentController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  TextEditingController CoursesController = TextEditingController();
  TextEditingController GroupController = TextEditingController();
  TextEditingController OfffieldCoursesController = TextEditingController();
  TextEditingController OfffieldGroupController = TextEditingController();
  TextEditingController DateController = TextEditingController();
  TextEditingController DetailController = TextEditingController();

  /////////////////////////////////////////////////////////////////////////////>>>>.localstorage
  final _formkey = GlobalKey<FormState>();
  var userData;
  var name;
  var surname;
  var mobile;
  var email;
  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    /* var userJson = localStorage.getString('user');
    var user = json.decode(userJson!); */
    setState(() {
      name = localStorage.getString('name');
      surname = localStorage.getString('surname');
      email = localStorage.getString('email');
      mobile = localStorage.getString('mobile');
      //userData = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'แจ้งตกค้าง',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              fontFamily: 'Sarabun'),
        ),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : Another(),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: SafeArea(
            child: Container(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                width: 405,
                height: 1100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color(0xffd1cccc),
                    width: 1,
                  ),
                ),
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ///////////////////////////////////////////////////>>>>>>.ชื่อ
                      SizedBox(height: 10.0),
                      Text(
                        "ชื่อ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        width: 340,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 3,
                                offset: Offset(0, 4),
                              )
                            ]),
                        child: Text(
                          '$name',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      /////////////////////////////////////////////////////////>>>>>นามสกุล
                      SizedBox(height: 20.0),
                      Text(
                        "นามสกุล",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        width: 340,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 3,
                                offset: Offset(0, 4),
                              )
                            ]),
                        child: Text(
                          '$surname',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      /////////////////////////////////////////////////////////>>>>รหัสนักศึกษา&เบอร์โทร
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "รหัสนักศึกษา",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 7.0),
                          Expanded(
                            child: Text(
                              " เบอร์โทร",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              flex: 1,
                              child: TextFormField(
                                validator: (value) {
                                  return value!.length < 10
                                      ? 'กรุณากรออกรหัสนักศึกษาให้ครบ 10 ตัว'
                                      : null;
                                },
                                controller: StudentController,
                                decoration: InputDecoration(
                                  counterText: '',
                                  /* errorText:
                                _validate ? 'กรุณากรอกข้อมูลให้ครบ' : null, */
                                  border: OutlineInputBorder(),
                                  contentPadding: const EdgeInsets.all(5),
                                  hintText: 'กรอกรหัสนักศึกษา',
                                  hintStyle: TextStyle(fontSize: 20),
                                  labelStyle: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                  ),
                                ),
                                maxLength: 10,
                              )),
                          SizedBox(width: 10.0),
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              validator: (value) {
                                return value!.length < 10
                                    ? 'กรุณากรอกเบอร์ให้ครบถ้วน  '
                                    : null;
                              },
                              controller: PhoneController,
                              decoration: InputDecoration(
                                counterText: '',
                                /* errorText:
                                _validate ? 'กรุณากรอกข้อมูลให้ครบ' : null, */
                                border: OutlineInputBorder(),
                                contentPadding: const EdgeInsets.all(5),
                                hintText: 'เบอร์โทร',
                                hintStyle: TextStyle(fontSize: 20),
                                labelStyle: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                ),
                              ),
                              maxLength: 10,
                            ),
                          ),
                        ],
                      ),
                      /////////////////////////////////////////////////>>>>>>>> รายวิชา & กลุ่มเรียน
                      SizedBox(height: 20.0),
                      Text(
                        " รายวิชาในสาขา",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      /* SizedBox(
                        width: 185,
                      ), */

                      DecoratedBox(
                          decoration: BoxDecoration(
                              border: new Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Container(
                            width: 340,
                            height: 48,
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                /* Text(
                                  "เลือกรายวิชา:",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.grey,
                                  ),
                                ), */

                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: Text(
                                        "กรุณาเลือกรายวิชา",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      items: subject_data?.map((item) {
                                        return new DropdownMenuItem(
                                            child: new Text(
                                              item['Subject_NameTh'],
                                              style: TextStyle(
                                                fontSize: 18.0,
                                              ),
                                            ),
                                            value: item['Subject_NameTh']
                                                .toString());
                                      }).toList(),
                                      onChanged: (String? newVal) {
                                        setState(() {
                                          subjectid = newVal!;
                                          CoursesController.text = subjectid!;
                                          print(subjectid.toString());
                                        });
                                      },
                                      value: subjectid,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                      SizedBox(height: 20.0),
                      Text(
                        "กลุ่มเรียน",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ///////////////////////////////////////////////////>>>>>>> กลุ่มเรียนภายในสาขา
                      DecoratedBox(
                          decoration: BoxDecoration(
                              border: new Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Container(
                            width: 340,
                            height: 48,
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: Text(
                                        "กรุณาเลือกกลุ่มเรียน",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      items: groups.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      onChanged: (String? groupValue) {
                                        setState(() {
                                          Groupvalue = groupValue!;
                                          GroupController.text = Groupvalue!;
                                          print(groupValue.toString());
                                        });
                                      },
                                      value: Groupvalue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      ///////////////////////////////////////////////////////>>>>>รายวิชานอก & กลุ่มเรียนนอกสาขา
                      SizedBox(height: 20.0),

                      Text(
                        " รายวิชานอกสาขา",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      TextField(
                        controller: OfffieldCoursesController,
                        decoration: InputDecoration(
                          /*  errorText:
                          _validate ? 'กรุณากรอกข้อมูลให้ครบ' : null,  */
                          border: OutlineInputBorder(),
                          contentPadding: const EdgeInsets.all(5),
                          hintText: 'รายวิชานอกสาขา ( ถ้าไม่มีให้ใส่ - )',
                          hintStyle: TextStyle(fontSize: 20),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      ////////////////////////////////////////////////////>>>>>>>>วันที่แจ้ง
                      SizedBox(height: 20),
                      Text(
                        "วันที่",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: DateController,
                        decoration: InputDecoration(
                            /*  errorText:
                                  _validate2 ? 'กรุณากรอกข้อมูลให้ครบ' : null, */
                            border: OutlineInputBorder(),
                            contentPadding: const EdgeInsets.all(5),
                            hintText: DateTime.now().toString(),
                            hintStyle: TextStyle(fontSize: 20),
                            labelStyle: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                            )),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));
                          if (pickedDate != null) {
                            print(pickedDate);
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(pickedDate);
                            print(formattedDate);
                            setState(() {
                              DateController.text = formattedDate;
                            });
                          } else {}
                        },
                      ),
                      ////////////////////////////////////////////////////////>>>>.รายละเอียด
                      SizedBox(height: 20.0),
                      Text(
                        "รายละเอียด",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: DetailController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        decoration: InputDecoration(
                            /* errorText:
                                  _validate3 ? 'กรุณากรอกข้อมูลให้ครบ' : null, */
                            border: OutlineInputBorder(),
                            contentPadding: const EdgeInsets.all(5),
                            hintText: 'เพิ่มรายละเอียด',
                            hintStyle: TextStyle(fontSize: 20),
                            labelStyle: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                            )),
                      ),
                      SizedBox(height: 40.0),
                      /////////////////////////////////////////////////////>>>>>ปุ่ม ส่งคำร้อง
                      Container(
                        width: 360,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.green[10],
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
                            primary: Colors.green[400],
                          ),
                          onPressed: () {
                            setState(
                              () async {
                                if (_formkey.currentState!.validate()) {
                                  _formkey.currentState!.save();

                                  final String Subject_Internal =
                                      CoursesController.text;
                                  final String Subject_External =
                                      OfffieldCoursesController.text;
                                  final String Residaual_Detail =
                                      DetailController.text;
                                  final String nameTh = name;
                                  final String surnameTh = surname;
                                  final String EmailStudent = 'null';
                                  final String mobile = PhoneController.text;
                                  final String studentCode =
                                      StudentController.text;
                                  final String Sec_Internal =
                                      GroupController.text;
                                  

                                  ///////////////////////////////////////////////////>>>>>>>>.post
                                  final Residues? _user = await POSTResidue(
                                      Subject_Internal,
                                      Subject_External,
                                      Residaual_Detail,
                                      nameTh,
                                      surnameTh,
                                      EmailStudent,
                                      mobile,
                                      studentCode,
                                      Sec_Internal,
                                  );

                                  setState(() {
                                    StudentController.text.isEmpty
                                        ? _validate1 = true
                                        : _validate1 = false;
                                    PhoneController.text.isEmpty
                                        ? _validate2 = true
                                        : _validate2 = false;
                                    CoursesController.text.isEmpty
                                        ? _validate3 = true
                                        : _validate3 = false;
                                    GroupController.text.isEmpty
                                        ? _validate4 = true
                                        : _validate4 = false;
                                    OfffieldCoursesController.text.isEmpty
                                        ? _validate5 = true
                                        : _validate5 = false;
                                    DateController.text.isEmpty
                                        ? _validate7 = true
                                        : _validate7 = false;
                                    DetailController.text.isEmpty
                                        ? _validate8 = true
                                        : _validate8 = false;
                                  });

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
                                                            Another(),
                                                      ));
                                                },
                                              ),
                                            ],
                                          ));
                                }

                                /* name = '';
                                surname = ""; */
                                StudentController.text = "";
                                PhoneController.text = "";
                                CoursesController.text = "";
                                GroupController.text = "";
                                OfffieldCoursesController.text = "";
                                
                                DateController.text = "";
                                DetailController.text = "";
                              },
                            );
                          },
                          child: Text(
                            'ยืนยันการส่งคำร้อง',
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
                        width: 360,
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
                )),
          )),
    );
  }
}