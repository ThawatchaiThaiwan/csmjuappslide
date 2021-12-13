import 'package:appcsmju/footbar/Another.dart';
import 'package:flutter/material.dart';

class Repair extends StatefulWidget {
  @override
  _RepairState createState() => _RepairState();
}

class _RepairState extends State<Repair> {
  TextEditingController textController = TextEditingController();
  String _input = "....";
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'แจ้งซ่อม',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,

                          child: TextField(
                            decoration: InputDecoration(
                                labelText: 'ชื่อ:',
                                labelStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: 'นามสกุล :',
                                labelStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: 'รหัสนักศึกษา :',
                                labelStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Expanded(
                          // optional flex property if flex is 1 because the default flex is 1
                          flex: 1,
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: 'ชั้นปี :',
                                labelStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'รายวิชาที่ต้องการจะแจ้งตกค้าง',
                          labelStyle: TextStyle(
                            color: Colors.grey[400],
                          )),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'วันที่แจ้ง',
                          labelStyle: TextStyle(
                            color: Colors.grey[400],
                          )),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      maxLines: 6,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          labelText: 'รายละเอียด',
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
                      child: RaisedButton(
                          child: Text('ส่งคำร้อง'),
                          onPressed: () {
                            setState(() {});
                          }),
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
                      child: RaisedButton(
                          child: Text('ยกเลิก'),
                          onPressed: () {
                            setState(() {});
                          }),
                    ),
                  ],
                )),
          )),
    );
  }
}
