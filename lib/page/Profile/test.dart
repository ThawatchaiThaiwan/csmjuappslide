// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:io';

import 'package:appcsmju/APImodel/Profilemodel.dart';
import 'package:appcsmju/page/Profile/Edit_profile.dart';

import 'package:http/http.dart' as http;
import 'package:appcsmju/api/apinew_foot.dart';
import 'package:appcsmju/footbar/Another.dart';

import 'package:appcsmju/model/loginmodel/login_page.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Profile2 extends StatefulWidget {
  @override
  _Profile2State createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  var userData;
  var name;
  var surname;
  var mobile;
  var email;
  var studentcode;
  ////////////////
  var nameEN;
  var surnameEN;
  var address;
  /* var fromCh = null; */
  /* var profile; */
  var ID;
  //var phone;
  var image;

  @override
  void initState() {
    _getUserInfo();
    findUser(); 
    super.initState();
  }

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
    });
  }


  Future<dynamic> findUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    studentcode = preferences.getString('Studentcode');
    var authToken = '1257|7D3I1qDi4m28ZWRMJTvSmVJ3kOYwSsBvyzJdQm16';
    var response = await http.get(
      Uri.parse("https://wwwdev.csmju.com/api/student/$studentcode"),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $authToken',
      },
    );
    var getuser = json.decode(response.body);
    print(getuser);
    var user = getuser['data'];
    print(user);
    for (var dataStudent in user) {
      print(dataStudent);
      if (nameEN?.isnotEmpty ?? true) {
        setState(() {
          ID = dataStudent['studentId'];
          name = dataStudent["nameTh"];
          surname = dataStudent["surnameTh"];
          nameEN = dataStudent["nameEn"];
          surnameEN = dataStudent["surnameEn"];
          email = dataStudent["EmailStudent"];
          mobile = dataStudent["mobile"];
          address = dataStudent["Address"];
          image = dataStudent["PictureProfile"];
          studentcode = dataStudent["studentCode"];
          print(name);      /////
          print(surname);  ////
          print(nameEN);   ////
          print(surnameEN); ////
          print(email); //////
          print(mobile);
          print(address);
          print(image);
          print(studentcode); /////
          print(ID);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[100],
        centerTitle: true,
        title: Text(
          'ข้อมูลส่วนตัว',
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
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /* Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(color: Colors.grey)
                  ), */
                  ////////////// 1st card///////////
                  Card(
                    elevation: 4.0,
                    color: Color(0xff24a878),
                    margin: EdgeInsets.only(left: 10, right: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 20, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ////////////////////////////////////////////////////////////////////>>>>>>>> image

                          Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: new BoxDecoration(
                                  border: Border.all(
                                      width: 3,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 3,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.2),
                                        offset: Offset(0, 10))
                                  ],
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new NetworkImage(image == null
                                          ? 'https://wwwdev.csmju.com/images/news/thumbnail/no_img.jpg'
                                          : image)))),

                          /////////////////////////////////////////////////////////////////////////>>>>>  first name
                          SizedBox(
                            height: 10,
                          ),
                          Card(
                            elevation: 4.0,
                            color: Colors.blueGrey[100],
                            margin: EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 15, top: 10, bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.account_circle,
                                          color: Colors.blueGrey[900],
                                        ),
                                      ),
                                      Text(
                                        'ชื่อ (Th)',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.blueGrey[900],
                                          fontSize: 17.0,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 35),
                                    child: Text(
                                      '$name',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.blueGrey[900],
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          ////////////////////////////////////////////////////////////////////>>>>>>>> last name
                          Card(
                            elevation: 4.0,
                            color: Colors.white,
                            margin: EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 15, top: 10, bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.account_circle,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'นามสกุล (Th)',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17.0,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 35),
                                    child: Text(
                                      '$surname',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ///////////////////////////////////////////////////////////////////////////////>>>>>>>>ชื่อภาษาอังกฤษ
                          Card(
                            elevation: 4.0,
                            color: Colors.blueGrey[100],
                            margin: EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 15, top: 10, bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.account_circle,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      Text(
                                        'ชื่อ (En)',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 17.0,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 35),
                                    child: Text(
                                      '$nameEN',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ////////////////////////////////////////////////////////////////////////////>>>>>>>>.นามสกุลภาษาอังกฤษ
                          Card(
                            elevation: 4.0,
                            color: Colors.white,
                            margin: EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 15, top: 10, bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.account_circle,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      Text(
                                        'นามสกุล (En)',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 17.0,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 35),
                                    child: Text(
                                      '$surnameEN',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          /////////////////////////////////////////////////////////////////////////////>>>>>>>>.StudentCode
                          Card(
                            elevation: 4.0,
                            color: Colors.white,
                            margin: EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 15, top: 10, bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.account_circle,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      Text(
                                        'รหัสนักศึกษา',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 17.0,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 35),
                                    child: Text(
                                      '$studentcode',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //////////// ////////////////////////////////////////////////////////////////>>>>>>>> Email
                          Card(
                            elevation: 4.0,
                            color: Colors.white,
                            margin: EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 15, top: 10, bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.mail,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      Text(
                                        'อีเมล',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 17.0,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 35),
                                    child: Text(
                                      '$email',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ////////////////////// phone ///////////
                          Card(
                            elevation: 4.0,
                            color: Colors.white,
                            margin: EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 15, top: 10, bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.phone,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      Text(
                                        'เบอร์โทรศัพท์',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 17.0,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 35),
                                    child: Text(
                                      '$mobile',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 4.0,
                            color: Colors.white,
                            margin: EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 15, top: 10, bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.location_on,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      Text(
                                        'ที่อยู่',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 17.0,
                                          decoration: TextDecoration.none,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 35),
                                    child: Text(
                                      '$address',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ////////////end  part////////////
                        ],
                      ),
                    ),
                  ),

                  /////////////// Button////////////
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        /////////// Edit Button /////////////
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FlatButton(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 8, bottom: 8, left: 10, right: 10),
                              child: Text(
                                'แก้ไข',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            color: Colors.blue,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => EditProfile()));
                            },
                          ),
                        ),

                        ////////////// logout//////////
                        ////////////// logout//////////

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FlatButton(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 8, bottom: 8, left: 10, right: 10),
                                child: Text(
                                  'Logout',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              color: Color(0xFFFF835F),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(20.0)),
                              onPressed: logout),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void logout() async {
    // logout from the server ...
    var res = await ApiService().getData('logout');
    var name;
    var surname;
    var mobile;
    var email;
    //var body = json.decode(res.body);
    //if (body['success']) {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('access_token');
    localStorage.remove('name');
    localStorage.remove('surname');
    localStorage.remove('mobile');
    localStorage.remove('email');
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => LoginPage()));
    // }
  }
}








///////////////////
///
///
/* image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new NetworkImage(
                                            _image != null
                                                ? _image!.path
                                                : image == null
                                                    ? 'https://wwwdev.csmju.com/images/news/thumbnail/no_img.jpg'
                                                    : image,
                                          ))), */




/* onPressed: () async {
                                    if (formKeyP.currentState!.validate()) {
                                      formKeyP.currentState!.save();
                                      Map<String, String> body = {
                                        //'studentId': ID,
                                        'nameTh': name,
                                        'surnameTh': surname,
                                        'nameEn': _nameENController.text,
                                        'surnameEn': _surnameENController.text,
                                        'studentCode': studentcode,
                                        'EmailStudent': _emailController.text,
                                        'mobile': _mobileController.text,
                                        'Address': _addressController.text,
                                      };
                                      print(body);
                                      service.postImage(
                                          body, _image!.path);
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
                                                    onPressed: () =>
                                                        Navigator.pop(
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
              
                                    ///////////////////////////////////////////////////>>>>>>>>.post
                                  } */