import 'package:appcsmju/footbar/Home.dart';
import 'package:appcsmju/footbar/Another.dart';
import 'package:appcsmju/footbar/News.dart';
import 'package:appcsmju/footbar/Calendar.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Foot extends StatefulWidget {
  const Foot({Key? key}) : super(key: key);

  @override
  _FootState createState() => _FootState();
}

var data;
bool hasdata = false;

Widget currentScreen = HomePageCarousel();
final PageStorageBucket bucket = PageStorageBucket();

class _FootState extends State<Foot> {
  int currentTab = 0;
  final List<Widget> screens = [
    HomePageCarousel(),
    News(),
    Calendar(),
    Another(),
  ];
  String qrData = "No data found!";
  var data;
  bool hasdata = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),

      // Fab Button////////////////////////////////////////////////////////////////>>>>>.qr แสกน
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.qr_code_scanner_sharp,
          size: 40,
          color: Colors.black87,
        ),
        backgroundColor: Color(0xff24a878),
        onPressed: () async {
          var options = ScanOptions(
            autoEnableFlash: false,
          );
          var data = await BarcodeScanner.scan(options: options);

          setState(() {
            qrData = data.rawContent.toString();
            hasdata = true;
          });
          if (qrData.contains("http")) {
            launch(qrData);
          }
        },
      ),
      ///////////////////////////////////////////////////////////////////////////////////////////////////
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
                        currentScreen = HomePageCarousel();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      /////////////////////////////////////////////////////////////////////////////////>>>.หน้าหลัก
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color:
                              currentTab == 0 ? Color(0xff24a878) : Colors.grey,
                        ),
                        Text(
                          'หน้าหลัก',
                          style: TextStyle(
                              color: currentTab == 0
                                  ? Color(0xff24a878)
                                  : Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                      ////////////////////////////////////////////////////////////////////////////////ข่าวสาร
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = News();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.chrome_reader_mode,
                          color:
                              currentTab == 1 ? Color(0xff24a878) : Colors.grey,
                        ),
                        Text(
                          '   ข่าวสาร   ',
                          style: TextStyle(
                              color: currentTab == 1
                                  ? Color(0xff24a878)
                                  : Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                  ////////////////////////////////////////////////////////////////////////////////>>>>>>.ปฏิทิน
                ],
              ),
              Row(
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Calendar();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          color:
                              currentTab == 2 ? Color(0xff24a878) : Colors.grey,
                        ),
                        Text(
                          ' ปฏิทิน ',
                          style: TextStyle(
                              color: currentTab == 2
                                  ? Color(0xff24a878)
                                  : Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    ////////////////////////////////////////////////////////////////////////////////>>>>>.บริการอื่นๆ
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
                          color:
                              currentTab == 3 ? Color(0xff24a878) : Colors.grey,
                        ),
                        Text(
                          'บริการอื่น ๆ',
                          style: TextStyle(
                              color: currentTab == 3
                                  ? Color(0xff24a878)
                                  : Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
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
