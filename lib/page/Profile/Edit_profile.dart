// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:appcsmju/APImodel/Profilemodel.dart';
import 'package:appcsmju/page/Profile/Profile.dart';
import 'package:appcsmju/post_api/ProfilePostandUpdate.dart';
import 'package:appcsmju/footbar/Another.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKeyP = GlobalKey<FormState>();
  var userData;
  var name;
  var surname;
  var mobile;
  var email;
  var studentcode;
  var ID;
  var nameEN;
  var surnameEN;
  var image;
  var address;
  var _image;
  ////////////////

  @override
  void initState() {
    _getUserInfop();
    findUser();
    super.initState();
  }

  void _getUserInfop() async {
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

//////////////////////////////////////////////////////////////////////>>>>>>>>get user
  ProfileP? profileP;
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
          ID = dataStudent['id'];
          name = dataStudent["nameTh"];
          surname = dataStudent["surnameTh"];
          nameEN = dataStudent["nameEn"];
          surnameEN = dataStudent["surnameEn"];
          email = dataStudent["EmailStudent"];
          mobile = dataStudent["mobile"];
          address = dataStudent["Address"];
          image = dataStudent["PictureProfile"];
          studentcode = dataStudent["studentCode"];
          print(name);
          print(surname);
          print(nameEN);
          print(surnameEN);
          print(email);
          print(mobile);
          print(address);
          print(image);
          print(studentcode);
          print(ID);
        });
      }
    }
  }

  ///////////////////////////////////////////////////////////////////>>>>>>>>>.controller.text
  TextEditingController _nameENController = TextEditingController();
  TextEditingController _surnameENController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _pictureProfileController = TextEditingController();

  /////////////////////////////////////////////////////////////////////////////////>>>>>>> imagepicker
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
  //////////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                key: _formKeyP,
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
                    color: Colors.white,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: new BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.indigo,

                                        spreadRadius:
                                            1.0, // has the effect of extending the shadow
                                      )
                                    ],
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                        fit: BoxFit.fill,
                                        image: new NetworkImage(image == null
                                            ? 'https://www.sacsteelwork.com/wp-content/uploads/2017/06/%E0%B8%AA%E0%B8%B5%E0%B8%AA%E0%B9%89%E0%B8%A1.jpg'
                                            : image))),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.image,
                                  color: Colors.blueGrey[900],
                                ),
                                onPressed: () {
                                  getImage();
                                },
                              ),
                            ],
                          ),

                          /////////////////////////////////////////////////////////////////////////>>>>> ชื่อ Th
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
                                        'ชื่อ',
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
                                      '$name',
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

                          ////////////////////////////////////////////////////////////////////>>>>>>>> นามสกุล Th
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
                                        'นามสกุล',
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
                                      '$surname',
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
                          ///////////////////////////////////////////////////////////////////////////////>>>>>>>>ชื่อภาษาอังกฤษ
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
                                        'ชื่อ (English)',
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
                                    child: TextField(
                                      controller: _nameENController,
                                      decoration: InputDecoration(
                                        hintText: nameEN,
                                      ),
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
                                        'นามสกุล (English)',
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
                                    child: TextField(
                                      controller: _surnameENController,
                                      decoration: InputDecoration(
                                        hintText: surnameEN,
                                      ),
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
                                    child: TextField(
                                      controller: _mobileController,
                                      decoration: InputDecoration(
                                        hintText: mobile,
                                      ),
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
                                    child: TextField(
                                      controller: _addressController,
                                      decoration:
                                          InputDecoration(hintText: address),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 35),
                                    child: TextField(
                                      controller: _pictureProfileController,
                                      decoration:
                                          InputDecoration(hintText: image),
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
                                'ยกเลิก',
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
                                      builder: (context) => Profile()));
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
                                    'บันทึก',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                color: Color(0xFFFF835F),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(20.0)),
                                onPressed: () async {
                                  ///////////////////////////////////////////////////>>>>>>>>.post
                                })),
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

  /* void logout() async {
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
  } */
}
