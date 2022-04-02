//Now let's create the article details page

import 'package:appcsmju/APImodel/Activity.dart';
import 'package:appcsmju/footbar/Another.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key, required this.activity}) : super(key: key);
  //Activitybelow({required this.article});
  final Activity activity;

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
   @override
  void initState() {
    _getUserInfo();

    super.initState();
  }

  final _formkey = GlobalKey<FormState>();
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

    name = localStorage.getString('name');
    surname = localStorage.getString('surname');
    email = localStorage.getString('email');
    mobile = localStorage.getString('mobile');
    studentcode = localStorage.getString('Studentcode');
    //userData = user;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          ' รายละเอียดโครงการ',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blueGrey[900],
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'Sarabun'),
        ),
        //titleTextStyle: TextStyle(color: Colors.blueGrey[900]),
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
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //////////////////////////////////////////////////////////>>>>>>>รูปภาพ
                Container(
                  height: 245.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    //let's add the height
                    image: DecorationImage(
                        image: NetworkImage(widget.activity.Activity_Picture),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Color(0xff24a878),
                      width: 2.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                /////////////////////////////////////////////////////////////>>>>>หัวข้อ
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    widget.activity.Activity_Title,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      letterSpacing: 1.2,
                      color: Colors.blueGrey[900],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sarabun',
                    ),
                  ),
                ),
                Divider(
                  thickness: 3,
                  indent: 15,
                  endIndent: 15,
                  color: Color(0xff24a878),
                ),
                //////////////////////////////////////////////////////////>>>>>>.รายละเอียดโครงการ
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    "รายละเอียด",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      letterSpacing: 1.2,
                      color: Colors.blueGrey[900],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sarabun',
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    widget.activity.Activity_Detail,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      letterSpacing: 0.98,
                      color: Colors.blueGrey[900],
                      fontSize: 18,
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'Sarabun',
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                ////////////////////////////////////////////////////////////////>>>>>>สถานที่จัดกิจกรรม
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    "สถานที่จัดกิจกรรม",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      letterSpacing: 1.2,
                      color: Colors.blueGrey[900],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sarabun',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    widget.activity.Activity_Location,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      letterSpacing: 0.98,
                      color: Colors.blueGrey[900],
                      fontSize: 18,
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'Sarabun',
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                ///////////////////////////////////////////////////////////////>>>>>จัดกิจกรรมโดย
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    "จัดกิจกรรมโดย",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      letterSpacing: 1.2,
                      color: Colors.blueGrey[900],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Sarabun',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    widget.activity.Activity_Organizer,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      letterSpacing: 0.98,
                      color: Colors.blueGrey[900],
                      fontSize: 18,
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'Sarabun',
                    ),
                  ),
                ),

                SizedBox(
                  height: 8.0,
                ),
                ///////////////////////////////////////////////////////>>>>>>วันที่
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        // color: Colors.black,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "วันที่ : ",
                            style: TextStyle(
                              color: Colors.blueGrey[900],
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Sarabun',
                            ),
                          ),
                          Text(
                            widget.activity.Activity_Start,
                            style: TextStyle(
                              color: Colors.blueGrey[900],
                              fontSize: 18,
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Sarabun',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "เวลา ",
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Sarabun',
                          ),
                        ),
                        Text(
                          widget.activity.Activity_TimeStart,
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 18,
                            //fontWeight: FontWeight.bold,
                            fontFamily: 'Sarabun',
                          ),
                        ),
                        Text(
                          " น. ถึง ",
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Sarabun',
                          ),
                        ),
                        Text(
                          widget.activity.Activity_TimeEnd,
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 18,
                            //fontWeight: FontWeight.bold,
                            fontFamily: 'Sarabun',
                          ),
                        ),
                        Text(
                          " น.",
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Sarabun',
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
    
}
