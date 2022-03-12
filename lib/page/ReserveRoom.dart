import 'dart:convert';
import 'package:appcsmju/footbar/Foot.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;
import 'package:appcsmju/footbar/Another.dart';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ReserveRoom extends StatefulWidget {
  const ReserveRoom({Key? key}) : super(key: key);

  @override
  State<ReserveRoom> createState() => _ReserveRoomState();
}

class _ReserveRoomState extends State<ReserveRoom> {
  ////////////////////////////////////////////////////////////////////////////////// api dropdpw

  // ignore: non_constant_identifier_names
  List? subject_data;
  String? subjectid;
  String? time;
  var url = Uri.encodeFull('https://wwwdev.csmju.com/api/classroom');
  Future<String> country() async {
    var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
    var res = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      'Authorization': 'Bearer $authToken',
    }); //if you have any auth key place here...properly..
    var resBody = json.decode(res.body);
    print(resBody);
    setState(() {
      subject_data = resBody;
    });

    return "Sucess";
  }

///////////////////////////////////////////////////////////////////////////////////////>>>>>>.Radio
  //String? _radioValue;

  //int? _radioValue2;
  //int correctScore = 0;

  /* void _handleRadioValueChange(value) {
    setState(() {
      _radioValue = value;
      GroupController.text = _radioValue.toString();
    });
  } */

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
  //Residues? _user;

  ///////////////////////////////////////////////////////////////////>>>>>>>>>controller

  TextEditingController _roomController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  /////////////////////////////////////////////////////////////////////////////>>>>.localstorage
  final formkey = GlobalKey<FormState>();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'จองห้องเรียน',
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
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ///////////////////////////////////////////////////>>>>>>.ชื่อ นามสกุล
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "ชื่อ",
                              style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 7.0),
                          Expanded(
                            child: Text(
                              "นามสกุล",
                              style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                              width: 340,
                              height: 50,
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
                                  ]),
                              child: Text(
                                '$name',
                                style: TextStyle(
                                  color: Colors.blueGrey[900],
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                              width: 340,
                              height: 50,
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
                                  ]),
                              child: Text(
                                '$surname',
                                style: TextStyle(
                                  color: Colors.blueGrey[900],
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
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
                                color: Colors.blueGrey[900],
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
                                color: Colors.blueGrey[900],
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
                            child: Container(
                              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                              width: 340,
                              height: 50,
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
                                  ]),
                              child: Text(
                                '$studentcode',
                                style: TextStyle(
                                  color: Colors.blueGrey[900],
                                  fontSize: 22,
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
                              //controller: PhoneController,
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
                                  color: Colors.blueGrey[900],
                                ),
                              ),
                              maxLength: 10,
                            ),
                          ),
                        ],
                      ),
                      /////////////////////////////////////////////////////////>>>>อีเมล์
                      SizedBox(height: 20.0),
                      Text(
                        "อีเมล",
                        style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        width: 340,
                        height: 50,
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
                            ]),
                        child: Text(
                          '$email',
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      /////////////////////////////////////////////////>>>>>>>> รายวิชา & กลุ่มเรียน
                      SizedBox(height: 20.0),
                      Text(
                        "เลือกห้องเรียน",
                        style: TextStyle(
                          color: Colors.blueGrey[900],
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
                                      //isCaseSensitiveSearch: true,
                                      hint: Text(
                                        "กรุณาเลือกห้องเรียน",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.blueGrey[900],
                                        ),
                                      ),
                                      items: subject_data!.map((item) {
                                        return new DropdownMenuItem(
                                            child: new Text(
                                              item['Classroom_Name'],
                                              style: TextStyle(
                                                fontSize: 18.0,
                                              ),
                                            ),
                                            value:
                                                item['ClassroomId'].toString());
                                      }).toList(),
                                      onChanged: (String? newVal) {
                                        setState(() {
                                          subjectid = newVal;
                                          _roomController.text = subjectid!;
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
                      //////////////////////////////////////////////////////>>>>>.วันเริ่มต้น
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "เวลาเริ่มต้นการจอง",
                              style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 7.0),
                          Expanded(
                            child: Text(
                              " เวลาสิ้นสุดการจอง",
                              style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              onTap: (() {
                                _selectTime(context);

                                setState(() {
                                  time = selectedTime.toString();
                                  _dateController.text = time.toString();
                                });
                              }),

                              validator: (value) {
                                return value!.length < 10
                                    ? 'กรุณาเลือกเวลาเริ่มต้น'
                                    : null;
                              },
                              controller: _dateController,

                              decoration: InputDecoration(
                                counterText: '',
                                /* errorText:
                                _validate ? 'กรุณากรอกข้อมูลให้ครบ' : null, */
                                border: OutlineInputBorder(),
                                contentPadding: const EdgeInsets.all(5),
                                hintText:
                                    "${selectedTime.hour}:${selectedTime.minute}",
                                hintStyle: TextStyle(fontSize: 20),
                                labelStyle: TextStyle(
                                  fontSize: 22,
                                  color: Colors.blueGrey[900],
                                ),
                              ),
                              //maxLength: 10,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          //////////////////////////////////////////////////////>>>>>.วันสิ้นสุด
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              validator: (value) {
                                return value!.length < 10
                                    ? 'กรุณาเลือกเวลาสิ้นสุด'
                                    : null;
                              },
                              //controller: PhoneController,
                              decoration: InputDecoration(
                                counterText: '',
                                /* errorText:
                                _validate ? 'กรุณากรอกข้อมูลให้ครบ' : null, */
                                border: OutlineInputBorder(),
                                contentPadding: const EdgeInsets.all(5),
                                hintText: 'เลือกเวลาสิ้นสุด',
                                hintStyle: TextStyle(fontSize: 20),
                                labelStyle: TextStyle(
                                  fontSize: 22,
                                  color: Colors.blueGrey[900],
                                ),
                              ),
                              //maxLength: 10,
                            ),
                          ),
                        ],
                      ),
                      /////////////////////////////////////////////////////////>>>>รายละเอียด
                      SizedBox(height: 20.0),
                      Text(
                        "รายละเอียด",
                        style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          return value!.length < 10
                              ? 'กรุณากรอกเบอร์ให้ครบถ้วน  '
                              : null;
                        },
                        //controller: PhoneController,
                        decoration: InputDecoration(
                          counterText: '',
                          /* errorText:
                                _validate ? 'กรุณากรอกข้อมูลให้ครบ' : null, */
                          border: OutlineInputBorder(),
                          contentPadding: const EdgeInsets.all(5),
                          hintText: 'เพิ่มรายละเอียด',
                          hintStyle: TextStyle(fontSize: 20),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            color: Colors.blueGrey[900],
                          ),
                        ),
                        maxLines: 5,
                        //maxLength: 10,
                      ),
                      SizedBox(height: 20.0),
                      /////////////////////////////////////////////////////////>>>>>อาจารย์ผู้รับรอง
                      Text(
                        "ชื่ออาจารย์ผู้รับรอง",
                        style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          return value!.length < 10
                              ? 'กรุณากรอกให้ครบถ้วน  '
                              : null;
                        },
                        //controller: PhoneController,
                        decoration: InputDecoration(
                          counterText: '',
                          /* errorText:
                                _validate ? 'กรุณากรอกข้อมูลให้ครบ' : null, */
                          border: OutlineInputBorder(),
                          contentPadding: const EdgeInsets.all(5),
                          hintText: 'เพิ่มชื่ออาจารย์ผู้รับรอง',
                          hintStyle: TextStyle(fontSize: 20),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            color: Colors.blueGrey[900],
                          ),
                        ),
                        //maxLines: 5,
                        maxLength: 50,
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
                                /* if (_formkey.currentState!.validate()) {
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
                                  final String studentCode =
                                      studentcode;
                                  final String Sec_Internal =
                                      GroupController.text;
                                  final String Sec_Another =
                                      AnotherGroupController.text;

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
                                      Sec_Another);

                                  /* setState(() {
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
                                        ? _validate8 = true
                                        : _validate8 = false;
                                  }); */

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

                                /* name = '';
                                surname = ""; */
                                StudentController.text = "";
                                PhoneController.text = "";
                                CoursesController.text = "";
                                GroupController.text = "";
                                OfffieldCoursesController.text = "";

                                DateController.text = "";
                                DetailController.text = ""; */
                              },
                            );
                          },
                          child: Text(
                            'ยืนยันการจอง',
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

  TimeOfDay selectedTime = TimeOfDay.now();
  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }
}
