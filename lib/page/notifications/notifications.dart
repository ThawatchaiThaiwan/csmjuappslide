import 'package:appcsmju/footbar/Home.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'แจ้งเเตือน',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: Colors.blueGrey[800],
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : HomePageCarousel(),
      ),
      body: Card(
        elevation: 6,
        margin: EdgeInsets.fromLTRB(12, 15, 12, 10),
        child: Container(
          alignment: Alignment.center,
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blueGrey[100],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.notifications_off_outlined,
              
                  size: 100, color: Color.fromARGB(255, 104, 179, 151)),
              ListTile(
                title: Text(
                  "ไม่มีการแจ้งเตือน \n การแจ้งเตือนทั้งหมดจะแสดงตรงนี้ \n กรุณากลับมาตรวจสอบอีกครั้งในภายหลัง",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[900],
                    fontFamily: 'Sarabun',
                  ),
                ),
                /* subtitle: Icon(
                  Icons.notifications_off_outlined,
                  color: Colors.blueGrey[900],
                ), */
              ),
            ],
          ),
        ),
      ),
    );
  }
}
