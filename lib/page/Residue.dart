// ignore_for_file: non_constant_identifier_names, unused_field

import 'dart:convert';
import 'dart:async';

import 'package:appcsmju/APImodel/Residuemodel.dart';
import 'package:appcsmju/footbar/Another.dart';
import 'package:appcsmju/footbar/Foot.dart';
import 'package:appcsmju/post_api/ResiduePost.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:search_choices/search_choices.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Residue extends StatefulWidget {
  @override
  _ResidueState createState() => _ResidueState();
}

class _ResidueState extends State<Residue> {
  ///////////////////////////////////////////////////////////////////>>>>>>>.dropdown list group
  String? Groupvalue;

  /* var groups = [
    'กลุ่มที่ 1',
    'กลุ่มที่ 2',
    'กลุ่มที่ 3',
  ]; */

////////////////////////////////////////////////////////////////////////////////// api dropdpw

  // ignore: non_constant_identifier_names
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

///////////////////////////////////////////////////////////////////////////////////////>>>>>>.Radio
  String? _radioValue;

  //int? _radioValue2;
  //int correctScore = 0;

  void _handleRadioValueChange(value) {
    setState(() {
      _radioValue = value;
      GroupController.text = _radioValue.toString();
    });
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
  bool _validate10 = false;

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
  TextEditingController AnotherGroupController = TextEditingController();
  TextEditingController Courses60Controller = TextEditingController();

  /////////////////////////////////////////////////////////////////////////////>>>>.localstorage
  final _formkey = GlobalKey<FormState>();
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

  ///////////////////////////////////////////////////////////////////////////////>>>>>cut string

  //String s = "abcdefghigklmnopqrstuvwxyzABCDEFGHIGKLMNOPQRSTUVWXYZ0123456789";
  //dynamic s = document.getElementById('email') ;
  //static ss = s.substring(s.indexOf(3,13);
  //var student.substring(1, 4);

  /* static const string = 'dartlang';
var result = string.substring(1); // 'artlang'
result = string.substring(1, 4);  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'แจ้งรายวิชาตกค้าง',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blueGrey[900],
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'Sarabun'),
        ),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: Colors.blueGrey[800],
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
                width: double.infinity,
                height: 950,
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
                          color: Colors.blueGrey[900],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[100],
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
                          ' $name $surname',
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      /////////////////////////////////////////////////////////>>>>อีเมล์
                      SizedBox(height: 10.0),
                      Text(
                        "อีเมล",
                        style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[100],
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
                          ' $email',
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      /////////////////////////////////////////////////////////>>>>รหัสนักศึกษา&เบอร์โทร
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "รหัสนักศึกษา",
                              style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 7.0),
                          Expanded(
                            child: Text(
                              " เบอร์โทร",
                              style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontSize: 20,
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
                            child: Container(
                              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                              width: double.infinity,
                              height: 48,
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey[100],
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
                                ' $studentcode',
                                style: TextStyle(
                                  color: Colors.blueGrey[900],
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
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
                                hintText: ' เบอร์โทร',
                                hintStyle: TextStyle(fontSize: 19),
                                labelStyle: TextStyle(
                                  fontSize: 19,
                                  color: Colors.blueGrey[900],
                                ),
                              ),
                              maxLength: 10,
                            ),
                          ),
                        ],
                      ),

                      /////////////////////////////////////////////////>>>>>>>> รายวิชา & กลุ่มเรียน
                      SizedBox(height: 10.0),
                      Text(
                        "รายวิชาในสาขา",
                        style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontSize: 20,
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
                            width: double.infinity,
                            height: 70,
                            //padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: DropdownButtonHideUnderline(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: SearchChoices.single(
                                  items: (subject_data != null &&
                                          subject_data!.isNotEmpty)
                                      ? subject_data?.map((item) {
                                          return new DropdownMenuItem(
                                            child: new Text(
                                              item['Subject_NameTh'],
                                              style: TextStyle(
                                                fontSize: 19.0,
                                              ),
                                            ),
                                            value: item['Subject_NameTh']
                                                .toString(),
                                          );
                                        }).toList()
                                      : [],
                                  value: subjectid,
                                  hint: "ค้นหารายวิชา",
                                  style: TextStyle(
                                    color: Colors.blueGrey[800],
                                    fontSize: 19.0,
                                    fontFamily: 'Sarabun',
                                  ),
                                  searchHint: "ค้นหารายวิชา",
                                  onChanged: (value) {
                                    setState(() {
                                      subjectid = value;
                                      CoursesController.text =
                                          subjectid.toString();
                                    });
                                  },
                                  isExpanded: true,
                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: 10.0),
                      Text(
                        " กลุ่มเรียน",
                        style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ///////////////////////////////////////////////////>>>>>>> กลุ่มเรียนภายในสาขา
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio<String>(
                            value: "กลุ่มที่1",
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          new Text(
                            'กลุ่มที่ 1',
                            style: new TextStyle(
                                fontSize: 19.0, color: Colors.blueGrey[900]),
                          ),
                          SizedBox(width: 12.0),
                          Radio<String>(
                            value: "กลุ่มที่2",
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          new Text(
                            'กลุ่มที่ 2',
                            style: new TextStyle(
                              fontSize: 19.0,
                              color: Colors.blueGrey[900],
                            ),
                          ),
                          SizedBox(width: 12.0),
                          Radio<String>(
                            value: "อื่นๆ",
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          Expanded(
                            flex: 4,
                            child: TextField(
                              controller: AnotherGroupController,
                              decoration: InputDecoration(
                                counterText: "",

                                /*  errorText:
                                _validate ? 'กรุณากรอกข้อมูลให้ครบ' : null,  */
                                border: OutlineInputBorder(),
                                contentPadding: const EdgeInsets.all(5),
                                hintText: ' อื่นๆโปรดระบุ',
                                hintStyle: TextStyle(fontSize: 19),
                                labelStyle: TextStyle(
                                  fontSize: 19,
                                  color: Colors.blueGrey[900],
                                ),
                              ),
                              maxLength: 2,
                            ),
                          ),
                          SizedBox(width: 10.0),
                        ],
                      ),
                      ///////////////////////////////////////////////////////>>>>>รายวิชาภายในสาขา หลักสูตร60
                      SizedBox(height: 10.0),

                      Text(
                        "รายวิชาภายในสาขาหลักสูตร 60",
                        style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      TextField(
                        controller: Courses60Controller,
                        decoration: InputDecoration(
                          /*  errorText:
                          _validate ? 'กรุณากรอกข้อมูลให้ครบ' : null,  */
                          border: OutlineInputBorder(),
                          contentPadding: const EdgeInsets.all(5),
                          hintText: ' ถ้าไม่มีให้ใส่ ( - )',
                          hintStyle: TextStyle(fontSize: 19),
                          labelStyle: TextStyle(
                            fontSize: 19,
                            color: Colors.blueGrey[900],
                          ),
                        ),
                      ),
                      ///////////////////////////////////////////////////////>>>>>รายวิชานอก & กลุ่มเรียนนอกสาขา
                      SizedBox(height: 10.0),

                      Text(
                        "รายวิชานอกสาขา",
                        style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontSize: 20,
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
                          hintText: ' ถ้าไม่มีให้ใส่ ( - )',
                          hintStyle: TextStyle(fontSize: 19),
                          labelStyle: TextStyle(
                            fontSize: 19,
                            color: Colors.blueGrey[900],
                          ),
                        ),
                      ),
                      ////////////////////////////////////////////////////////>>>>.รายละเอียด
                      SizedBox(height: 10.0),
                      Text(
                        "รายละเอียด",
                        style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontSize: 20,
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
                            hintText: ' เพิ่มรายละเอียด',
                            hintStyle: TextStyle(fontSize: 19),
                            labelStyle: TextStyle(
                              fontSize: 19,
                              color: Colors.blueGrey[900],
                            )),
                      ),
                      SizedBox(height: 30.0),
                      /////////////////////////////////////////////////////>>>>>ปุ่ม ส่งคำร้อง
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
                                  final String nameThp = name;
                                  final String surnameThp = surname;
                                  final String EmailStudent = email;
                                  final String mobile = PhoneController.text;
                                  final String studentCode = studentcode;
                                  final String Sec_Internal =
                                      GroupController.text;
                                  final String Sec_Another =
                                      AnotherGroupController.text;
                                      final String Subject60 =
                                      Courses60Controller.text;

                                  ///////////////////////////////////////////////////>>>>>>>>.post
                                  final Residues? _user = await POSTResidue(
                                      Subject_Internal,
                                      Subject_External,
                                      Residaual_Detail,
                                      nameThp,
                                      surnameThp,
                                      EmailStudent,
                                      mobile,
                                      studentCode,
                                      Sec_Internal,
                                      Sec_Another,
                                      Subject60);

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
                                    AnotherGroupController.text.isEmpty
                                        ? _validate9 = true
                                        : _validate9 = false;
                                    Courses60Controller.text.isEmpty
                                        ? _validate10 = true
                                        : _validate10 = false;
                                  });

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
                                    desc:
                                        'เราได้แจ้งตกค้างให้คุณแล้ว กรุณารอการตอบรับจากเจ้าหน้าที่',
                                    descTextStyle: TextStyle(
                                      color: Colors.blueGrey[700],
                                      fontSize: 18,
                                    ),
                                    btnOkColor: Color(0xff24a878),
                                    btnOkOnPress: () {
                                      Navigator.pop(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Foot(),
                                          ));
                                    },
                                    btnOkIcon: Icons.check_circle,
                                    onDissmissCallback: (type) {
                                      debugPrint(
                                          'Dialog Dissmiss from callback $type');
                                    },
                                  ).show();
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
                            'ยืนยัน',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ///////////////////////////////////////////////////>>>>>>>ปุ่มยกเลิก
                      SizedBox(height: 20.0),
                      Container(
                        width: double.infinity,
                        height: 35,
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
                            setState(() {
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Another(),
                                  ));
                            });
                          },
                          child: Text(
                            'ยกเลิก',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
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
