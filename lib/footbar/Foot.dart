import 'package:appcsmju/model/carouselmodel/HomeCarousel.dart';
import 'package:appcsmju/footbar/Home.dart';
import 'package:appcsmju/footbar/Another.dart';
import 'package:appcsmju/footbar/News.dart';
import 'package:appcsmju/footbar/Calendar.dart';
import 'package:appcsmju/footbar/Scan.dart';
import 'package:appcsmju/model/loginmodel/login_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:barcode_scan/barcode_scan.dart';

class Foot extends StatefulWidget {
  const Foot({Key? key}) : super(key: key);

  @override
  _FootState createState() => _FootState();
}

String qrData = "No data found!";
var data;
bool hasdata = false;

Widget currentScreen = HomePage();
final PageStorageBucket bucket = PageStorageBucket();

class _FootState extends State<Foot> {
  int currentTab = 0;
  final List<Widget> screens = [
    HomePage(),
    News(),
    Scan(),
    Calendar(),
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
        onPressed: () async {
          var options = ScanOptions(
            autoEnableFlash: true,
          );
          var data = await BarcodeScanner.scan(options: options);
          setState(() {
            qrData = data.rawContent.toString();
            hasdata = true;
          });

          showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: Text(
                      "พบแหล่งข้อมูล:  ${(qrData)}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('ไปยังลิงค์',
                            textAlign: TextAlign.center),
                        onPressed: hasdata
                            ? () async {
                                if (!await canLaunch(qrData)) {
                                  print(qrData);
                                  await launch(qrData);
                                } else {
                                  throw 'Could not launch ';
                                }
                              }
                            : null,
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(
                          context,
                          'ยกเลิก',
                        ),
                        child: const Text(
                          'ยกเลิก',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ));
        },
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
                            color: currentTab == 0 ? Colors.blue : Colors.grey,fontSize: 20,fontWeight: FontWeight.bold
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
                        currentScreen = News();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.chrome_reader_mode,
                          color: currentTab == 1 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          '   ข่าวสาร   ',
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.blue : Colors.grey,fontSize: 20,fontWeight: FontWeight.bold
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
                        currentScreen = Calendar();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          color: currentTab == 2 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          ' ปฏิทิน ',
                          style: TextStyle(
                            color: currentTab == 2 ? Colors.blue : Colors.grey,fontSize: 20,fontWeight: FontWeight.bold
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
                            color: currentTab == 3 ? Colors.blue : Colors.grey,fontSize: 20,fontWeight: FontWeight.bold
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
