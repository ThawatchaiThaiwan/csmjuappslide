// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:http/http.dart' as http;
import 'package:appcsmju/APImodel/BorrowReturnPostmodel.dart';
import 'package:appcsmju/APImodel/Borrowmodel.dart';
import 'package:appcsmju/footbar/Another.dart';
import 'package:appcsmju/footbar/Foot.dart';
import 'package:appcsmju/page/Borrowreturn.dart/Borrowstatus.dart';
import 'package:appcsmju/post_api/BorrowReturnpost.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Borrowreturn extends StatefulWidget {
  @override
  _BorrowreturnState createState() => _BorrowreturnState();
}

class _BorrowreturnState extends State<Borrowreturn> {
  Map<String, String> selectedValueMap = Map();
  @override
  void initState() {
    _getUserInfo();
    equipmentapp();
    selectedValueMap["server"] = "";
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

  /////////////////////////////////////////////////////////////////////////>>>>>>>api dropdow

  /* Future<List> getServerData() async {
    String url = 'https://wwwdev.csmju.com/api/equipmentapp';
//    String url = 'http://192.168.43.34:3000/numbers';
    var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
    final response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $authToken"
    });

    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> responseBody = json.decode(response.body);
      // ignore: deprecated_member_use
      List<String> countries =
          new List.from(responseBody.map((item) => item['Equipment_Name']));
      for (int i = 0; i < responseBody.length; i++) {
        countries.add(responseBody[i]['Equipment_Name']);
      }
      return countries;
    } else {
      print("error from server : $response");
      throw Exception('Failed to load post');
    }
  } */

  List? room_data;
  List<Borrowblackmodel> equipment_data = [];
  String? roomid;
  var selectedNumber;
  var url = Uri.encodeFull('https://wwwdev.csmju.com/api/equipmentapp');
  Future<String> equipmentapp() async {
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

  ///////////////////////////////////////////////////////////////////>>>>>> textcontroller
  TextEditingController _EquipmenController = TextEditingController();
  TextEditingController _DatefristController = TextEditingController();
  TextEditingController _DatereturnController = TextEditingController();
  TextEditingController _NoteController = TextEditingController();

  ///
  final formkey = GlobalKey<FormState>();
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
                  MaterialPageRoute(builder: (context) => ListBorrow()));
            },
            icon: Icon(
              Icons.repeat,
              color: Colors.blueGrey[800],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: SafeArea(
          child: Form(
            key: formkey,
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              width: double.infinity,
              height: 710,
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

                  /* Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Color(0xffd1cccc),
                        width: 1,
                      ),
                    ),
                    child: FutureBuilder<List>(
                      future: getServerData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return getSearchableDropdown(
                              snapshot.data, "อุปกรณ์");
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  ), */

                  //////////////////////////////////////////////////////////////////
                  Container(
                    height: 48,
                    width: double.infinity,
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
                      ],
                    ),
                    child: SearchableDropdown.single(
                      items: (room_data != null && room_data!.isNotEmpty)
                          ? room_data?.map((item) {
                              return new DropdownMenuItem(
                                child: new Text(
                                  item['Equipment_Name'],
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                value: item['Equipment_Name'].toString(),
                              );
                            }).toList()
                          : [],
                      value: roomid,
                      hint: "Select one",
                      searchHint: null,
                      onChanged: (value) {
                        setState(() {
                          roomid = value;
                          _EquipmenController.text = roomid.toString();
                        });
                      },
                      dialogBox: false,
                      isExpanded: true,
                      menuConstraints:
                          BoxConstraints.tight(Size.fromHeight(350)),
                    ),
                  ),
                  ////////////////////////////////////////////////////////////////////////

                  /* SearchableDropdown(

      items: items.map((item) {
        List<DropdownMenuItem> items = [];
    for (int i = 0; i < listData!.length; i++) {
      items.add(new DropdownMenuItem(
        child: new Text(
          listData[i],
        ),
        value: listData[i],
      ));
    }
      }).toList(),
      value: selectedValueMap,
      isCaseSensitiveSearch: false,
      hint: new Text(
        'เลือกอุปกรณ์',
      ),
      searchHint: new Text(
        'ค้นหาอุปกรณ์',
        style: new TextStyle(fontSize: 20),
      ),
      onChanged: (value) {
        setState(() {
          selectedValueMap = value;
          _EquipmenController.text = selectedValueMap.toString();
        });
      },
    ), */
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
                          onChanged: (val) {
                            setState(() {
                              var date = val.toString();
                              _DatefristController.text = date;
                            });
                          },
                          validator: (val) {
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
                          onChanged: (val) {
                            setState(() {
                              var date1 = val.toString();
                              _DatereturnController.text = date1;
                            });
                          },
                          validator: (val) {
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
                      border: Border.all(color: Colors.grey),
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
                      "อีเมล",
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
                      border: Border.all(color: Colors.grey),
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
                    height: 10,
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
                    child: Text(
                        "*ผู้ยืมมีหน้าที่ต้องชดใช้ความเสียหายในกรณีที่ทรัพย์สินชํารุด หรือสูญหาย ตามมูลค่าทรัพย์สิน หากความเสียหายนั้นเกิดจากความประมาทของผู้ยืม",
                        style: TextStyle(
                          letterSpacing: 1.2,
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
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
                        setState(() async {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();

                            final String Equipment_Name =
                                _EquipmenController.text;
                            final String Borrow_Date =
                                _DatefristController.text;
                            final String Borrow_Details = _NoteController.text;
                            final String Return_Date =
                                _DatereturnController.text;
                            final String Status = "รอการอนุมัติ";
                            final String FirstName = name;
                            final String LastName = surname;
                            final String Email = email;

                            ///////////////////////////////////////////////////>>>>>>>>.post
                            final BorrowReturnPostmodel? _user =
                                await postBorrowreturn(
                              Equipment_Name,
                              Borrow_Date,
                              Borrow_Details,
                              Return_Date,
                              Status,
                              FirstName,
                              LastName,
                              Email,
                            );

                            ///////////////////////////////////////////////////>>>>>>>>.post

                            if (_NoteController.text.isNotEmpty) {
                              showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: const Text('แจ้งเตือน'),
                                        content: const Text('ยืมสำเร็จ'),
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
                          fontSize: 20,
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
      ),
    );
  }

  /* Widget getSearchableDropdown(List<dynamic>? listData, mapKey) {
    List<DropdownMenuItem> items = [];
    for (int i = 0; i < listData!.length; i++) {
      items.add(new DropdownMenuItem(
        child: new Text(
          listData[i],
        ),
        value: listData[i],
      ));
    }
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButtonHideUnderline(
        child: new SearchableDropdown(
          items: items,
          value: selectedValueMap[mapKey],
          isCaseSensitiveSearch: false,
          hint: new Text(
            'เลือกอุปกรณ์',
          ),
          searchHint: new Text(
            'ค้นหาอุปกรณ์',
            style: new TextStyle(fontSize: 20),
          ),
          onChanged: (value) {
            setState(() {
              selectedValueMap[mapKey] = value;
              _EquipmenController.text = selectedValueMap[mapKey].toString();
            });
          },
        ),
      ),
    );
  } */

  /* Future<List<Borrowbackmodel>> getData(filter) async {
    var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
    var queryParameters = {
      'filter': filter,
    };
    var response = await Dio().get(
      "https://wwwdev.csmju.com/api/equipments/code/",
      queryParameters: queryParameters,
      options: Options(
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $authToken',
        },
      ),
    );

    var models = Borrowbackmodel.fromJsonList(response.data);
    return models;
  } */
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