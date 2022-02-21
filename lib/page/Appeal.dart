// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison

import 'dart:async';
import 'dart:io';
import 'package:appcsmju/post_api/AppealPost.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:appcsmju/footbar/Another.dart';
import 'package:flutter/material.dart' hide Action;

class Appeal extends StatefulWidget {
  @override
  _AppealState createState() => _AppealState();
}

AppealService service = AppealService();
File? _image;
bool _validate = false;
bool _validate2 = false;
bool _validate3 = false;

////////////////////////////////////////////////////////////////////////////////////////
class _AppealState extends State<Appeal> {
  /*  File file = new File(''); */

  ////////////////////////////////////////////////////////////////////////////////////////
  // ignore: unused_field
  //PostAppeal? _user;
  TextEditingController TitelController1 = TextEditingController();
  TextEditingController DateController2 = TextEditingController();
  TextEditingController DetailController3 = TextEditingController();

  final formkey = GlobalKey<FormState>();
  void initState() {
    DateController2.text = ""; //set the initial value of text field
    super.initState();
  }

  /////////////////////////////////////////////////////////image picker
  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    final pickFile = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickFile != null) {
        _image = File(pickFile.path);
      } else {
        print('No image selected.');
      }
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
            'ติดต่อหลักสูตร',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blueGrey[900],
              fontSize: 27.0,
              fontWeight: FontWeight.bold,
            ),
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
                  width: 405,
                  height: 800,
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
                        /////////////////////////////////////////////////////>>>>หัวเรื่อง
                        SizedBox(height: 10.0),
                        Text(
                          " หัวข้อเรื่อง",
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          controller: TitelController1,
                          decoration: InputDecoration(
                            errorText:
                                _validate ? 'กรุณากรอกข้อมูลให้ครบ' : null,
                            border: OutlineInputBorder(),
                            contentPadding: const EdgeInsets.all(5),
                            hintText: 'เพิ่มหัวเรื่อง',
                            hintStyle: TextStyle(fontSize: 20),
                            labelStyle: TextStyle(
                              fontSize: 22,
                              color: Colors.blueGrey[900],
                            ),
                          ),
                        ),
                        ///////////////////////////////////////////////////////////>>>>>>.วันที่
                        SizedBox(height: 20.0),
                        Text(
                          "วันที่",
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          controller: DateController2,
                          decoration: InputDecoration(
                              errorText:
                                  _validate2 ? 'กรุณากรอกข้อมูลให้ครบ' : null,
                              border: OutlineInputBorder(),
                              contentPadding: const EdgeInsets.all(5),
                              hintText: DateTime.now().toString(),
                              hintStyle: TextStyle(fontSize: 20),
                              labelStyle: TextStyle(
                                fontSize: 22,
                                color: Colors.blueGrey[900],
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
                                DateController2.text = formattedDate;
                              });
                            } else {}
                          },
                        ),
                        /////////////////////////////////////////////////////////////////>>>>.รายละเอียด
                        SizedBox(height: 20.0),
                        Text(
                          "รายละเอียด",
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          controller: DetailController3,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          decoration: InputDecoration(
                              errorText:
                                  _validate3 ? 'กรุณากรอกข้อมูลให้ครบ' : null,
                              border: OutlineInputBorder(),
                              contentPadding: const EdgeInsets.all(5),
                              hintText: 'เพิ่มรายละเอียด',
                              hintStyle: TextStyle(fontSize: 20),
                              labelStyle: TextStyle(
                                fontSize: 22,
                                color: Colors.blueGrey[900],
                              )),
                        ),
                        //////////////////////////////////////////////////////////>>>>>>.รูปภาพ
                        SizedBox(height: 20.0),
                        Text(
                          "เลือกรูปภาพ",
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white12,
                            ),
                            onPressed: () {
                              getImage();
                            },
                            child: Text(
                              "อัพโหลดรูปภาพ",
                              style: TextStyle(
                                  color: Colors.blueGrey[900],
                                  fontSize: 17,
                                  fontFamily: 'Sarabun',
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(height: 10.0),
                        ///////////////////////////////////////////////////////>>>>>โชว์รูปภาพ
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          width: 340,
                          height: 110,
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
                          child: Container(
                            height: 330,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey[300],
                                image: DecorationImage(
                                    image: (_image != null)
                                        ? FileImage(_image!)
                                        : NetworkImage(
                                                "https://www.google.com/imgres?imgurl=https%3A%2F%2Fimages.ctfassets.net%2F23aumh6u8s0i%2F4TsG2mTRrLFhlQ9G1m19sC%2F4c9f98d56165a0bdd71cbe7b9c2e2484%2Fflutter&imgrefurl=https%3A%2F%2Fauth0.com%2Fblog%2Fflutter-authentication-authorization-with-auth0-part-1-adding-authentication-to-an-app%2F&tbnid=lNQwUR-RALy6qM&vet=12ahUKEwjfsZCqrMz1AhUOAbcAHf_wAtEQMygcegUIARD0AQ..i&docid=SNh1PLjUtAswOM&w=588&h=528&itg=1&q=FLUTTER%20IMAGE&ved=2ahUKEwjfsZCqrMz1AhUOAbcAHf_wAtEQMygcegUIARD0AQ")
                                            as ImageProvider,
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        /////////////////////////////////////////////////////////>>>>>>ปุ่ม>ส่งคำร้อง
                        SizedBox(height: 40),
                        Container(
                          width: 375,
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
                                primary: Colors.green[400]),
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                formkey.currentState!.save();
                                Map<String, String> body = {
                                  'Complain_Title': TitelController1.text,
                                  'Complain_Date': DateController2.text,
                                  'Complain_Detail': DetailController3.text
                                };
                                setState(() {
                                  TitelController1.text.isEmpty
                                      ? _validate = true
                                      : _validate = false;
                                  DateController2.text.isEmpty
                                      ? _validate2 = true
                                      : _validate2 = false;
                                  DetailController3.text.isEmpty
                                      ? _validate3 = true
                                      : _validate3 = false;
                                });

                                service.addImage(body, _image!.path);
                                Navigator.pop(context);

                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: const Text('แจ้งเตือน'),
                                          content: const Text(
                                              'ติดต่อหลักสูตรสำเร็จ'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                context,
                                                'ตกลง',
                                              ),
                                              child: const Text(
                                                'ตกลง',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ));
                              }

                              TitelController1.text = "";
                              DateController2.text = "";
                              DetailController3.text = "";
                              setState(() {
                                _image = null;
                              });
                            },
                            child: Text(
                              'ส่งคำร้อง',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        ////////////////////////////////////////////////>>>>>.ปุ่ม>ยกเลิก
                        SizedBox(height: 20.0),
                        Container(
                          width: 375,
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
                              setState(() {
                                Navigator.push(
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
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            )));
  }
}
