// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:appcsmju/APImodel/ReserveRoommodel.dart';
import 'package:appcsmju/footbar/Foot.dart';
import 'package:appcsmju/page/ReserveRoom/ListReserve.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:http/http.dart' as http;
import 'package:appcsmju/footbar/Another.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appcsmju/post_api/ReserveRoompost.dart';

class ReserveRoom1 extends StatefulWidget {
  const ReserveRoom1({Key? key}) : super(key: key);

  @override
  State<ReserveRoom1> createState() => _ReserveRoom1State();
}

class _ReserveRoom1State extends State<ReserveRoom1> {
  //ReserveRoomService service = ReserveRoomService();
  ////////////////////////////////////////////////////////////////////////////////// api dropdpw

  /* List<String> adviser = [
    "อาจารย์ อรรถวิทชังคมานนท์",
    "ผู้ช่วยศาสตราจารย์ ก่องกาญจน์ดุลยไชย",
    "อาจารย์ ดร. กิตติกรหาญตระกูล",
    "ผู้ช่วยศาสตราจารย์ ดร. สนิทสิทธิ"
        "อาจารย์ อลงกตกองมณี"
        "ผู้ช่วยศาสตราจารย์ ภานุวัฒน์เมฆะ"
        "ผู้ช่วยศาสตราจารย์ ดร. พาสน์ปราโมกข์ชน"
        "ผู้ช่วยศาสตราจารย์ ดร. ปวีณเขื่อนแก้ว"
        "อาจารย์ ดร. พยุงศักดิ์เกษมสำราญ"
        "อาจารย์ ดร. สมนึกสินธุปวน"
        "อาจารย์ ดร. นษิตันติธารานุกุล"
        "อาจารย์ ดร. กิติศักดิ์โอสถานันต์กุล"
  ]; */
  String? adviser_id;
  List? room_data;
  String? roomid;
  String? time;
  var url = Uri.encodeFull('https://wwwdev.csmju.com/api/classroom');
  Future<String> room() async {
    var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
    var res = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      'Authorization': 'Bearer $authToken',
    }); //if you have any auth key place here...properly..
    var resBody = json.decode(res.body);
    print(resBody);
    setState(() {
      room_data = resBody;
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

  /* bool _validate1 = false;
  bool _validate2 = false;
  bool _validate3 = false;
  bool _validate4 = false;
  bool _validate5 = false;
  bool _validate6 = false;
  bool _validate7 = false;
  bool _validate8 = false;
  bool _validate9 = false; */

////////////////////////////////////////////////////////////////////////////////////

  @override
  void initState() {
    _getUserInfo();
    // _TimefristController.text = "";
    //_TimeendController.text = "";
    //DateController2.text = "";
    super.initState();
    this.room();
  }

  /////////////////////////////////////////////////////////////////////>>>>>>>. post
  ReserveRoommodel? _user;

  ///////////////////////////////////////////////////////////////////>>>>>>>>>controller

  TextEditingController _roomController = TextEditingController();
  TextEditingController _TimefristController = TextEditingController();
  TextEditingController _TimeendController = TextEditingController();
  TextEditingController _DeteilController = TextEditingController();
  TextEditingController _AdviserController = TextEditingController();

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
    final hoursfrist = _timefrist.hour.toString().padLeft(2, '0');
    final minutesfrist = _timefrist.minute.toString().padLeft(2, '0');
    final hoursend = _timeend.hour.toString().padLeft(2, '0');
    final minutesend = _timeend.minute.toString().padLeft(2, '0');
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListReserve()));
            },
            icon: Icon(
              Icons.list_rounded,
              color: Colors.blueGrey[800],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: SafeArea(
            child: Container(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                width: double.infinity,
                height: 820,
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
                      Text(
                        "ชื่อ-นามสกุล",
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

                      /////////////////////////////////////////////////>>>>>>>> รายวิชา & กลุ่มเรียน
                      SizedBox(height: 10.0),
                      Text(
                        "เลือกห้องเรียน",
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
                            height: 48,
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: DropdownButton(
                              underline: Padding(
                                padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
                              ),
                              isExpanded: true,
                              hint: Text(
                                " กรุณาเลือกห้องเรียน",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.blueGrey[900],
                                ),
                              ),
                              items: room_data?.map((item) {
                                return new DropdownMenuItem(
                                  child: new Text(
                                    item['Classroom_Name'],
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  value: item['Classroom_Name'].toString(),
                                );
                              }).toList(),
                              onChanged: (String? newVal) {
                                setState(() {
                                  roomid = newVal;
                                  _roomController.text = roomid!;
                                  print(roomid.toString());
                                });
                              },
                              value: roomid,
                            ),
                          )),
                      SizedBox(height: 10.0),
                      /////////////////////////////////////////////////////////////////////////////>>>>>.วันเริ่มต้น
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "เวลาเริ่มต้นการจอง",
                              style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 7.0),
                          /////////////////////////////////////////////////////////////////////////////>>>>>.วันสิ้นสุด
                          Expanded(
                            child: Text(
                              " เวลาสิ้นสุดการจอง",
                              style: TextStyle(
                                color: Colors.blueGrey[900],
                                fontSize: 20,
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
                          /////////////////////////////////////////////////////////////////////////////>>>>>.วันเริ่มต้น
                          Expanded(
                            flex: 1,
                            child: Container(
                              // padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                              height: 48,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xff24a878),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Color(0xff24a878),
                                  width: 1,
                                ),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff24a878),
                                ),
                                onPressed: () {
                                  _selectTimefrist(context);

                                  
                                },
                                child: Text(
                                  '$hoursfrist:$minutesfrist',
                                  style: TextStyle(
                                    color: Colors.blueGrey[900],
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: 10.0),
                          ///////////////////////////////////////////////////////////////////////////////>>>>>.วันสิ้นสุด
                          Expanded(
                            flex: 1,
                            child: Container(
                              //padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                              height: 48,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xff24a878),
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Color(0xff24a878),
                                  width: 1,
                                ),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff24a878),
                                ),
                                onPressed: () {
                                  _selectTimeend(context);
                                
                                },
                                child: Text(
                                  '$hoursend:$minutesend',
                                  style: TextStyle(
                                    color: Colors.blueGrey[900],
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //////////////////////////////////////////////////////////////////////////////>>>>รายละเอียด
                      SizedBox(height: 10.0),
                      Text(
                        "รายละเอียด",
                        style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        /* validator: (value) {
                          return value!.length < 10
                              ? 'กรุณากรอกเบอร์ให้ครบถ้วน  '
                              : null;
                        }, */
                        controller: _DeteilController,
                        decoration: InputDecoration(
                          counterText: '',
                          /* errorText:
                                _validate ? 'กรุณากรอกข้อมูลให้ครบ' : null, */
                          border: OutlineInputBorder(),
                          contentPadding: const EdgeInsets.all(5),
                          hintText: ' เพิ่มรายละเอียด',
                          hintStyle: TextStyle(fontSize: 19),
                          labelStyle: TextStyle(
                            fontSize: 19,
                            color: Colors.blueGrey[900],
                          ),
                        ),
                        maxLines: 5,
                        //maxLength: 10,
                      ),
                      SizedBox(height: 10.0),
                      /////////////////////////////////////////////////////////////////////////////>>>>>อาจารย์ผู้รับรอง
                      Text(
                        "ชื่ออาจารย์ผู้รับรอง",
                        style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          height: 48,
                          width: double.infinity,
                          child: DropdownSearch<String>(
                            mode: Mode.DIALOG,
                            showSelectedItems: true,
                            dropdownSearchBaseStyle: TextStyle(
                              fontSize: 19,
                              fontFamily: 'sarabun',
                            ),

                            items: [
                              "อาจารย์ อรรถวิท ชังคมานนท์",
                              "ผู้ช่วยศาสตราจารย์ ก่องกาญจน์ ดุลยไชย",
                              "อาจารย์ ดร.กิตติกร หาญตระกูล",
                              "ผู้ช่วยศาสตราจารย์ ดร.สนิท สิทธิ",
                              "อาจารย์ อลงกต กองมณี",
                              "ผู้ช่วยศาสตราจารย์ ภานุวัฒน์ เมฆะ",
                              "ผู้ช่วยศาสตราจารย์ ดร.พาสน์ ปราโมกข์ชน",
                              "ผู้ช่วยศาสตราจารย์ ดร.ปวีณ เขื่อนแก้ว",
                              "อาจารย์ ดร.พยุงศักดิ์ เกษมสำราญ",
                              "อาจารย์ ดร.สมนึก สินธุปวน",
                              "อาจารย์ ดร.นษิ ตันติธารานุกุล",
                              "อาจารย์ ดร.กิติศักดิ์ โอสถานันต์กุล"
                            ],

                            hint: "กรุณาเลือกอาจารย์ผู้รับรอง",

                            popupItemDisabled: (String s) => s.startsWith('I'),
                            onChanged: (String? newVal) {
                              setState(() {
                                adviser_id = newVal;
                                _AdviserController.text = adviser_id!;
                                print(adviser_id.toString());
                              });
                            },
                            //value: roomid,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      //////////////////////////////////////////////////////////////////////////////>>>>>>หมายเหตุ
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Text(
                          "*หมายเหตุ : เมื่อเลิกใช้งานแล้วกรุณารักษาความสะอาด จัดห้องในตำแหน่งเติมและหากมีอุปกรณ์ชำรุดหรือสูญหายผู้ขอใช้ห้องต้องรับผิดชอบทั้งหมด",
                          style: TextStyle(
                            letterSpacing: 1.2,
                            fontSize: 16,
                            color: Colors.red,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),

                      SizedBox(height: 30.0),
                      ////////////////////////////////////////////////////////////////////////////>>>>>ปุ่ม ส่งคำร้อง
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
                              if (formkey.currentState!.validate()) {
                                formkey.currentState!.save();

                                final String Classroom_Name =
                                    _roomController.text;
                                final String Book_TimeStart = hoursfrist.toString() + ":" + minutesfrist.toString();
                                    
                                final String Book_TimeEnd = hoursend.toString() + ':' + minutesend.toString();
                                    
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

                                ///////////////////////////////////////////////////////////////////>>>>>>>>.post
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

                                //////////////////////////////////////////////////////////////////////>>>>>>>>.post

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
                                      'จองห้องเรียนสำเร็จ กรุณารอการอนุมัติจากเจ้าหน้าที่',
                                  descTextStyle: TextStyle(
                                    color: Colors.blueGrey[700],
                                    fontSize: 18,
                                  ),
                                  btnOkColor: Color(0xff24a878),
                                  btnOkOnPress: () {
                                    Navigator.push(
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
                            });
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
                      ///////////////////////////////////////////////////////////////////////>>>>>>>ปุ่มยกเลิก
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

  TimeOfDay _timefrist = TimeOfDay.now();

  var newTimefirst;
  _selectTimefrist(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: _timefrist,
      //initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null) {
      setState(() {
        _timefrist = timeOfDay;
      });
    }
  }

  TimeOfDay _timeend = TimeOfDay.now();
  //var _timeend1;
  var newTimeend;
  _selectTimeend(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: _timeend,
      //initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null) {
      setState(() {
        _timeend = timeOfDay;
      });
    }
  }

  /* TimeOfDay selectedTime = TimeOfDay.now();
  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
      
    );
    setState(() {
      selectedTime = timeOfDay!;
    }); */

}
