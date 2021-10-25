import 'package:appcsmju/ProgressHUD.dart';
import 'package:appcsmju/api/api_service.dart';
import 'package:appcsmju/model/login_model.dart';
import 'package:flutter/material.dart';
import '../Homebinding/Home.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  late LoginRequestModel requestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

 
  @override
  void initState() {
    super.initState();
    requestModel = new LoginRequestModel(email: '', password: '');
  }

 

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSteup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    );
  }

  Widget _uiSteup(BuildContext context) {
    // ignore: unused_local_variable
    
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: scaffoldKey,
      backgroundColor:Color(0xff4baef5),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            
            Stack(
              children: <Widget>[
                new Image.asset("images/login.png"),
                Form(
                  key: globalFormKey,
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
                          style:
                              TextStyle(color: Colors.black),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => requestModel.email = input!,
                          validator: (input) => !input!.contains('@')
                              ? "กรุณากรอกรหัสนักศึกษาที่ถูกต้อง"
                              : null,
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
                          style:
                              TextStyle(color: Colors.black),
                          keyboardType: TextInputType.text,
                          onSaved: (input) => requestModel.password = input!,
                          validator: (input) => input!.length < 4
                              ? "รหัสผ่านควรมากกว่า 5 ตัวอักษร"
                              : null,
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
                                color: Color(0xff4baef5)
                                    .withOpacity(0.4),
                                icon: Icon(hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // ignore: deprecated_member_use
                      FlatButton(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 40,
                        ),
                        onPressed: () {
                          if (validateAndSave()) {
                            print(requestModel.toJson());
                            setState(() {
                              isApiCallProcess = true;
                            });
                            APIService apiService = new APIService();
                            apiService.login(requestModel).then((value) {
                              // ignore: unnecessary_null_comparison
                              if (value != null) {
                                setState(() {
                                  isApiCallProcess = false;
                                });

                                if (value.token.isNotEmpty) {
                                  final snackBar = routh()(
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                    
                                    return HomePage();
                                  })));
                                  scaffoldKey.currentState!
                                      // ignore: deprecated_member_use
                                      .showSnackBar(snackBar);
                                } else {
                                  final snackBar =
                                      SnackBar(content: Text(value.error));
                                  scaffoldKey.currentState!
                                      // ignore: deprecated_member_use
                                      .showSnackBar(snackBar);
                                }
                              }
                            });
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.black),
                        ),
                        color: Color(0xffeceff0),
                        shape: StadiumBorder(),
                      ),
                      SizedBox(
                        height: 20,
          
                       
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  routh() {}
}
