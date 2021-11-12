// ignore_for_file: non_constant_identifier_names


import 'package:appcsmju/post_api/AppealPost.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'package:appcsmju/api/appealpost.dart';
import 'package:appcsmju/footbar/Another.dart';
import 'package:flutter/material.dart';
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

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[75],
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'ร้องเรียน',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
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
        body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
            child: SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  width: 405,
                  height: 740,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color(0xffd1cccc),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      TextField(
                        controller: TitelController1,
                        decoration: InputDecoration(
                            labelText: 'เรื่องที่จะร้องเรียน',
                            labelStyle: TextStyle(
                              color: Colors.grey[400],
                            )),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        controller: DateController2,
                        decoration: InputDecoration(
                            labelText: 'วันที่',
                            labelStyle: TextStyle(
                              color: Colors.grey[400],
                            )),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        controller: DetailController3,
                        maxLines: 6,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                            labelText: 'รายละเอียด',
                            labelStyle: TextStyle(
                              color: Colors.grey[400],
                            )),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        controller: PictureController4,
                        decoration: InputDecoration(
                            labelText: 'เลือกรูปภาพ',
                            labelStyle: TextStyle(
                              color: Colors.grey[400],
                            )),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        width: 315,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
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
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff08ef03), Color(0xd34ce749)],
                          ),
                        ),
                        child: ElevatedButton(
                          child: Text('ส่งคำร้อง'),
                          onPressed: () async {
                            final String Complain_Title = TitelController1.text;
                            final String Complain_Date = DateController2.text;
                            final String Complain_Detail =
                                DetailController3.text;
                            final String Complain_Picture =
                                PictureController4.text;

                            final PostAppeal? user = await createUser(
                                Complain_Detail,
                                Complain_Date,
                                Complain_Picture,
                                Complain_Title);
                            _formkey.currentState?.reset();
                          },
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        width: 315,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
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
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xffe90b0b), Color(0xd3e74949)],
                          ),
                        ),
                        child: ElevatedButton(
                            child: Text('ยกเลิก'),
                            onPressed: () {
                              setState(() {});
                            }),
                      ),
                    ],
                  )),
            )));
  }
}
