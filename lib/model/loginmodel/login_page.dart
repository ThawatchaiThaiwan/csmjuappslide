import 'package:appcsmju/ProgressHUD.dart';
import 'package:appcsmju/footbar/Foot.dart';
import 'package:appcsmju/api/APIlogin.dart';
import 'package:appcsmju/APImodel/login_model.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  late LoginRequestModel loginRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel(username: '', password: '');
  }

  @override
  // ignore: override_on_non_overriding_member
  Widget builds(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
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
      backgroundColor: Color(0xff4baef5),
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
                            left: 20.0, right: 20.0, bottom: 10.0, top: 500.0),
                        decoration: new BoxDecoration(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(25.0)),
                            color: Color.fromARGB(255, 240, 240, 240)),
                        child: new TextFormField(
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) =>
                              loginRequestModel.username = input!,
                          // validator: (input) => !input.contains('@')
                          //  ? "รหัสนักศึกษาไม่ถูกต้อง"
                          //  : null,
                          decoration: new InputDecoration(
                            hintText: "Username",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Theme.of(context).accentColor,
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
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) =>
                              loginRequestModel.password = input!,
                          /* validator: (input) =>
                              input!.length < 6 ? "รหัสผ่านไม่ถูกต้อง" : null, */
                          obscureText: hidePassword,
                          decoration: new InputDecoration(
                            hintText: "Password",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Theme.of(context).accentColor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.4),
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
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
                            print(loginRequestModel.toJson());
                            setState(() {
                              isApiCallProcess = true;
                            });

                            APIService apiService = new APIService();
                            apiService.login(loginRequestModel).then((value) {
                              if (value != null) {
                                setState(() {
                                  isApiCallProcess = false;
                                });

                                if (value.token.isNotEmpty) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Foot(),
                                      ));
                                } else {
                                  final snackBar =
                                      SnackBar(content: Text('ไปพบ Username หรือ Password นี้!'));
                                  scaffoldKey.currentState!
                                      .showSnackBar(snackBar);
                                }
                              }
                            });
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Sarabun'),
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
/* if (response.statusCode == 200) {     
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Foot(),
            ));
      } else {
        errorSnackBar(context, 'sorry to have issue');
      } */