import 'dart:convert';
import 'package:appcsmju/footbar/Foot.dart';
import 'package:appcsmju/model/loginmodel/apilogin.dart';
import 'package:appcsmju/model/loginmodel/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  String email = '';
  String password = '';

  loginPressed() async {
    if (email.isNotEmpty && password.isNotEmpty) {
      http.Response response = await AuthServices().login(email, password);
     Map<String,dynamic> userdata = new Map<String,dynamic>.from(json.decode(response.body));
      //var responseMap = jsonDecode(userdata);// please wait i am trying okkk
      if (response.statusCode == 200) {     
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Foot(),
            ));
      } else {
        errorSnackBar(context, 'sorry to have issue');
      }
    } else {
      errorSnackBar(context, 'คุณใส่ข้อมูลไม่ครบถ้วน');
    }
  }

  @override
  // ignore: unused_element
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xff4baef5),
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: <Widget>[
              new Image.asset("images/login.png"),
              Form(
                child: Column(
                  children: <Widget>[
                    new Container(
                      margin: new EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 10.0, top: 540.0),
                      decoration: new BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(25.0)),
                          color: Color.fromARGB(255, 240, 240, 240)),
                      child: new TextFormField(
                        onChanged: (value) {
                          email = value;
                        },
                        style: TextStyle(color: Colors.black, fontSize: 25),
                        decoration: new InputDecoration(
                          hintText: "StudentCode",
                          prefixIcon: Icon(
                            Icons.people,
                            color: Color(0xff4baef5),
                          ),
                        ),
                      ),
                    ),

                    new Container(
                      margin: new EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 10.0, top: 10.0),
                      decoration: new BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(25.0)),
                          color: Color.fromARGB(255, 240, 240, 240)),
                      child: new TextFormField(
                        onChanged: (value) {
                          password = value;
                        },
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                        obscureText: hidePassword,
                        decoration: new InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color(0xff4baef5),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: Color(0xff4baef5).withOpacity(0.4),
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    // ignore: deprecated_member_use
                    FlatButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 40,
                      ),
                      onPressed: () async{
                       
                          await loginPressed();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      color: Color(0xffeceff0),
                      shape: StadiumBorder(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
