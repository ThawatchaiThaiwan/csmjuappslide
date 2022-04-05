// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'dart:io';
import 'package:appcsmju/page/Profile/Profile.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;
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
  ProfileService service = ProfileService();

  final formKeyP = GlobalKey<FormState>();

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
  File? imageprofile;
  ////////////////

////////////////////////////////////////////////////////////////////////////////>>>>
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
  //ProfileP? profileP;
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
    var user = getuser['data'];
    print(user);
    for (var dataStudent in user) {
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
        });
      }
    }
  }

  ///////////////////////////////////////////////////////////////////>>>>>>>>>.controller.text
  TextEditingController _nameENController = TextEditingController();
  TextEditingController _surnameENController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  /////////////////////////////////////////////////////////////////////////////////>>>>>>> imagepicker
  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    final pickFile = await _picker.getImage(
        maxWidth: 800, maxHeight: 800, source: ImageSource.gallery);

    setState(() {
      if (pickFile != null) {
        imageprofile = File(pickFile.path);
        print(imageprofile);
      } else {
        print('No image selected.');
      }
    });
  }
  //////////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              ///////////////////////////////////////////////////////////รูปใหญ่
              child: Container(
                decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: (imageprofile != null)
                            ? FileImage(imageprofile!)
                            : NetworkImage(
                                image == null
                                    ? 'https://wwwdev.csmju.com/images/news/thumbnail/no_img.jpg'
                                    : image,
                              ) as ImageProvider,
                        fit: BoxFit.cover)),
              ),
            ),
            Form(
              key: formKeyP,
              child: Container(
                margin: EdgeInsets.fromLTRB(16, 200, 16, 16),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16.0),
                          margin: EdgeInsets.only(top: 16.0),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[800],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 96.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //////////////////////////////////////////////////////////ชื่อ นามสกุล
                                      Text('$name $surname',
                                          style: TextStyle(
                                              fontSize: 26.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900,
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                              fontFamily: 'Sarabun')),
                                      ///////////////////////////////////////////////////////////รหัสนักศึกษา
                                      ListTile(
                                        contentPadding: EdgeInsets.all(0),
                                        title: Text('$studentcode',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Sarabun',
                                            )),
                                        ////////////////////////////////////////////////////////////อีเมลบน
                                        subtitle: Text('$email',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Sarabun',
                                            )),
                                      )
                                    ]),
                              ),
                              SizedBox(height: 10.0),
                            ],
                          ),
                        ),
                        ///////////////////////////////////////////////////รูปเล็ก
                        Stack(
                          children: [
                            Container(
                              height: 80.0,
                              width: 80.0,
                              decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image: (imageprofile != null)
                                          ? FileImage(imageprofile!)
                                          : NetworkImage(
                                              image == null
                                                  ? 'https://wwwdev.csmju.com/images/news/thumbnail/no_img.jpg'
                                                  : image,
                                            ) as ImageProvider,
                                      fit: BoxFit.cover)),
                              margin: EdgeInsets.only(left: 16.0),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 37,
                                  width: 37,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 2,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 3,
                                          blurRadius: 10,
                                          color: Colors.black.withOpacity(0.2),
                                          offset: Offset(0, 10))
                                    ],
                                    color: Colors.blueGrey[100],
                                  ),
                                  child: IconButton(
                                    iconSize: 20,
                                    icon: Icon(Icons.edit),
                                    color: Colors.blue,
                                    onPressed: () {
                                      getImage();
                                    },
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[600],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            /////////////////////////////////////////////////////ข้อมูลผู้ใช้
                            title: Text(
                              'ข้อมูลผู้ใช้',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Sarabun',
                              ),
                            ),
                          ),
                          //////////////////////////////////////////////////////ชื่อ-นามสกุล
                          Divider(
                            color: Colors.white,
                          ),
                          ListTile(
                            title: Text(
                              'ชื่อ (อังกฤษ)',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Sarabun',
                              ),
                            ),
                            subtitle: TextField(
                              controller: _nameENController,
                              decoration: InputDecoration(
                                hintText: '$nameEN',
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Sarabun',
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Sarabun',
                              ),
                            ),
                            leading: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'นามสกุล (อังกฤษ)',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Sarabun',
                              ),
                            ),
                            subtitle: TextField(
                              controller: _surnameENController,
                              decoration: InputDecoration(
                                hintText: '$surnameEN',
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Sarabun',
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Sarabun',
                              ),
                            ),
                            leading: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),

                          /////////////////////////////////////////////////////Email
                          ListTile(
                            title: Text(
                              'อีเมล',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Sarabun',
                              ),
                            ),
                            subtitle: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                hintText: '$email',
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Sarabun',
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Sarabun',
                              ),
                            ),
                            leading: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                          ),
                          /////////////////////////////////////////////////////////เบอร์โทร
                          ListTile(
                            title: Text(
                              'เบอร์โทรศัพท์',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Sarabun',
                              ),
                            ),
                            subtitle: TextField(
                              controller: _mobileController,
                              decoration: InputDecoration(
                                hintText: '$mobile',
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Sarabun',
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Sarabun',
                              ),
                            ),
                            leading: Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                          ),
                          /////////////////////////////////////////////////////////ที่อยู่
                          ListTile(
                            title: Text(
                              'ที่อยู่',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Sarabun',
                              ),
                            ),
                            subtitle: TextField(
                              controller: _addressController,
                              decoration: InputDecoration(
                                hintText: '$address',
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Sarabun',
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Sarabun',
                              ),
                            ),
                            leading: Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 40),
                          Container(
                            width: 290,
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
                                  primary: Color(0xff24a878)),
                              onPressed: () async {
                                /* final bytes =
                                    File(imageprofile!.path).readAsBytesSync();
                                String base64Image = "data:image/png;base64," +
                                    base64Encode(bytes);

                                print("img_pan : $base64Image"); */
                                if (formKeyP.currentState!.validate()) {
                                  formKeyP.currentState!.save();
                                  Map<String, String> body = {
                                    'studentId': ID.toString(),
                                    'nameTh': name,
                                    'surnameTh': surname,
                                    'nameEn': _nameENController.text,
                                    'surnameEn': _surnameENController.text,
                                    'studentCode': studentcode,
                                    'EmailStudent': _emailController.text,
                                    'mobile': _mobileController.text,
                                    'Address': _addressController.text,
                                    //'PictureProfile': base64Image,
                                  };

                                  service.postImage(body, imageprofile!.path);

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
                                    desc: 'แก้ไขโปรไฟล์สำเร็จ',
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
                                                Profile(),
                                          ));
                                    },
                                    btnOkIcon: Icons.check_circle,
                                    onDissmissCallback: (type) {
                                      debugPrint(
                                          'Dialog Dissmiss from callback $type');
                                    },
                                  ).show();
                                }
                              },
                              child: Text(
                                'บันทึก',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    ///////////////////////////////////////////////////////////
                  ],
                ),
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
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
          ],
        ),
      ),
    );
  }
}
