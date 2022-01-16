// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:appcsmju/post_api/AppealPost.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:appcsmju/footbar/Another.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:http/http.dart' as http;

class Appeal extends StatefulWidget {
  @override
  _AppealState createState() => _AppealState();
}

Future<PostAppeal?> createUser(String Complain_Detail, String Complain_Date,
    String Complain_Picture, String Complain_Title) async {
  final String apiUrl = "https://wwwdev.csmju.com/api/complainadd";

  final response = await http.post(Uri.parse(apiUrl), body: {
    "Complain_Title": Complain_Title,
    "Complain_Date": Complain_Date,
    "Complain_Detail": Complain_Detail,
    "Complain_Picture": Complain_Picture,
  });

  if (response.statusCode == 201) {
    final String responseString = response.body;

    return postAppealFromJson(responseString);
  } else {
    return null;
  }
}

class _AppealState extends State<Appeal> {
  // ignore: unused_field
  PostAppeal? _user;
  TextEditingController TitelController1 = TextEditingController();
  TextEditingController DateController2 = TextEditingController();
  TextEditingController DetailController3 = TextEditingController();
  TextEditingController PictureController4 = TextEditingController();

  final formkey = GlobalKey<FormState>();
  void initState() {
    DateController2.text = ""; //set the initial value of text field
    super.initState();
  }

  /////////////////////////////////////////////////////////image picker
  final ImagePicker _picker = ImagePicker();
  XFile? image;

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
              color: Colors.black,
              fontSize: 27.0,
              fontWeight: FontWeight.bold,
            ),
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
                  height: 700,
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
                        SizedBox(height: 10.0),
                        Text(
                          " หัวข้อเรื่อง",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          controller: TitelController1,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: const EdgeInsets.all(5),
                              hintText: 'เพิ่มหัวเรื่อง',
                              hintStyle: TextStyle(fontSize: 20),
                              labelStyle: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                              )
                              /* hintText: 'กรอกชื่อเรื่อง',
                              labelStyle: TextStyle(
                                fontSize: 8,
                                color: Colors.grey[400],
                              ) */
                              ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          "วันที่",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        /*  Container(
                          
                          child: Text(DateTime.now().toString()),
                          decoration: BoxDecoration(),
                        ), */
                        TextField(
                          controller: DateController2,
                          decoration: InputDecoration(
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
                                DateController2.text = formattedDate;
                              });
                            } else {}
                          },
                        ),
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
                          controller: DetailController3,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: const EdgeInsets.all(5),
                              hintText: 'เพิ่มรายละเอียด',
                              hintStyle: TextStyle(fontSize: 20),
                              labelStyle: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                              )),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          "เลือกรูปภาพ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextField(
                          onTap: () {
                            filePicker();
                            image == null
                                ? Text(
                                    "ไม่มีรูปที่เลือก",
                                    style: TextStyle(fontSize: 20),
                                  )
                                : Image.file(
                                    File(image!.path),
                                    width: 100,
                                    fit: BoxFit.cover,
                                  );
                          },
                          controller: PictureController4,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: const EdgeInsets.all(5),
                              hintText: 'เลือกรูปภาพ',
                              hintStyle: TextStyle(fontSize: 20),
                              labelStyle: TextStyle(
                                fontSize: 22,
                                color: Colors.grey[400],
                              )),
                        ),
                        SizedBox(height: 40.0),
                        Container(
                          width: 375,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green[100],
                            border: Border.all(
                              color: Color(0xd309ef04),
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
                              showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: const Text('แจ้งเตือน'),
                                        content:
                                            const Text('ติดต่อหลักสูตรสำเร็จ'),
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

                              final String Complain_Title =
                                  TitelController1.text;
                              final String Complain_Date = 
                                  DateController2.text;
                              final String Complain_Detail =
                                  DetailController3.text;
                              final String Complain_Picture =
                                  PictureController4.text;
                              TitelController1.text = "";
                              DateController2.text = "";
                              DetailController3.text = "";
                              PictureController4.text = "";
                              final PostAppeal? user = await createUser(
                                  Complain_Detail,
                                  Complain_Date,
                                  Complain_Picture,
                                  Complain_Title
                                  );
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

  Future<void> filePicker() async {
    final XFile? selectImage =
          await _picker.pickImage(source: ImageSource.gallery);
          String? fileName = selectImage?.path.split('/').last;
    /* print(selectImage!.path); */
    setState(() {
      image = selectImage;
    });
  }
}
