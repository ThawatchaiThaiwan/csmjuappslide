import 'package:appcsmju/api/apinew_foot.dart';
import 'package:appcsmju/model/loginmodel/login_page.dart';
import 'package:appcsmju/page/Activityanoter.dart';
import 'package:appcsmju/page/Appeal.dart';
import 'package:appcsmju/page/Borrow_back.dart';
import 'package:appcsmju/page/Profile/Profile.dart';
import 'package:appcsmju/page/Residue.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Another extends StatefulWidget {
  const Another({Key? key}) : super(key: key);

  @override
  _AnotherState createState() => _AnotherState();
}

class _AnotherState extends State<Another> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "บริการอื่นๆ",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontSize: 27, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.person),
          color: Colors.black, //ยังไม่ได้เชื่อปุ่ม icons
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_active),
            color: Colors.black,
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: GridView(
              children: [
                //////////////////////////////////////////////////////////////////>>>>>.ข้อมูลส่วนตัว
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: Container(
                    width: 120,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0x237dc0f3),
                        border: Border.all(color: Color(0x237dc0f3))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 50,
                          color: Colors.grey,
                        ),
                        Text(
                          "ข้อมูลส่วนตัว",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                ///////////////////////////////////////////////////////////>>>>แจ้งตกค้าง
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Residue()));
                  },
                  child: Container(
                    width: 120,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0x237dc0f3),
                        border: Border.all(color: Color(0x237dc0f3))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.library_books,
                          size: 50,
                          color: Colors.grey,
                        ),
                        Text(
                          "แจ้งตกค้าง",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                /////////////////////////////////////////////////////////>>>>>.ยืมคืน
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Appeal()));
                  },
                  child: Container(
                    width: 120,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0x237dc0f3),
                        border: Border.all(color: Color(0x237dc0f3))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.feedback_outlined,
                          size: 50,
                          color: Colors.grey,
                        ),
                        Text(
                          "ติดต่อหลักสูตร",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                ///////////////////////////////////////////////////////////>>>>>>ยืมคืน
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Borrow_Back()));
                  },
                  child: Container(
                    width: 120,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0x237dc0f3),
                        border: Border.all(color: Color(0x237dc0f3))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.compare_arrows,
                          size: 50,
                          color: Colors.grey,
                        ),
                        Text(
                          "ยืม-คืน",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                ////////////////////////////////////////////////////////>>>>>.โครงการทั้งหมด
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ActivityAnoter()));
                  },
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0x237dc0f3),
                        border: Border.all(color: Color(0x237dc0f3))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.ballot,
                          size: 50,
                          color: Colors.grey,
                        ),
                        Text(
                          "โครงการทั้งหมด",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                //////////////////////////////////////////////////////>>>>>>.ออกจากระบบ
                InkWell(
                  onTap: () {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                'แจ้งเตือน',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Sarabun'),
                              ),
                              content: const Text(
                                'ต้องการออกจากระบบหรือไม่',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Sarabun'),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  /* onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  }, */
                                  onPressed: () {
                                    /* Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                LoginPage()),
                                        ModalRoute.withName('/')); */
                                    logout();
                                  },
                                  child: const Text(
                                    'ตกลง',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Sarabun'),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(
                                    context,
                                    'ยกเลิก',
                                  ),
                                  child: const Text(
                                    'ยกเลิก',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Sarabun'),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ));
                  },
                  child: Container(
                    width: 120,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0x237dc0f3),
                        border: Border.all(color: Color(0x237dc0f3))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout,
                          size: 50,
                          color: Colors.red[700],
                        ),
                        Text(
                          "ออกจากระบบ",
                          style: TextStyle(
                              color: Colors.red[700],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10)),
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
