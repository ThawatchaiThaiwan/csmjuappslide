import 'package:appcsmju/Homebinding/Home.dart';
import 'package:appcsmju/footbar/Another.dart';
import 'package:appcsmju/footbar/Bookroom.dart';
import 'package:appcsmju/footbar/Residaual.dart';
import 'package:appcsmju/footbar/Scan.dart';
import 'package:flutter/material.dart';

class Foot extends StatefulWidget {
  const Foot({Key? key}) : super(key: key);

  @override
  _FootState createState() => _FootState();
}


Widget currentScreen = HomePage();
final PageStorageBucket bucket = PageStorageBucket();

class _FootState extends State<Foot> {
  int currentTab = 0;
  final List<Widget> screens = [
    HomePage(),
    Bookroomdata(),
    Scan(),
    Residaual(),
    Another(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      // Fab Button
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.qr_code_scanner_sharp,
          size: 40,
          color: Colors.black87,
        ),
        backgroundColor: Colors.blue,
        onPressed: () {},
      ),
      //Fab position
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //botton app bar
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60, // ขนาด Tab Bar ข้างล่าง
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = HomePage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'หน้าหลัก',
                          style: TextStyle(
                            color: currentTab == 0 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                      ///////////////////////////////////////////////////////////////////////////////////////////
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Bookroomdata();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.bookmark_add,
                          color: currentTab == 1 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'จองห้องเรียน',
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  )
                  ///////////////////////////////////////////////////////////////////////////////////////////
                ],
              ),
              Row(
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Residaual();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.add_to_photos_rounded,
                          color: currentTab == 2 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'แจ้งตกค้าง',
                          style: TextStyle(
                            color: currentTab == 2 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                    ///////////////////////////////////////////////////////////////////////////////////////////
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Another();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.widgets_sharp,
                          color: currentTab == 3 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'บริการอื่น ๆ',
                          style: TextStyle(
                            color: currentTab == 3 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  )
                  ///////////////////////////////////////////////////////////////////////////////////////////
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
