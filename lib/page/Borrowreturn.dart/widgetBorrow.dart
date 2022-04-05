//Now let's create the article details page

import 'package:appcsmju/APImodel/BorrowReturnPostmodel.dart';

import 'package:appcsmju/footbar/Home.dart';
import 'package:flutter/material.dart';

class Borrowstatus extends StatelessWidget {
  final BorrowReturnPostmodel article;

  Borrowstatus({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          ' รายละเอียดการยืมคืน',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              fontFamily: 'Sarabun'),
        ),
        titleTextStyle: TextStyle(color: Colors.blueGrey[900]),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 630,
          width: double.infinity,
          decoration: BoxDecoration(
            //color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Card(
            
            elevation: 4.0,
            margin: EdgeInsets.fromLTRB(1, 5, 1, 5),
            child: Column(
              //padding: const EdgeInsets.all(10.0),
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
        
              children: [
                Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10)),
        
                //////////////////////////////////////////////////////////>>>>>>>ชื่อห้องเรียน
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('ชื่อรายการยืม : ',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sarabun',
                          color: Colors.blueGrey[900])),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      // color: Colors.black,
                      //borderRadius: BorderRadius.circular(20.0),
                      ),
                  child: Text(
                    article.Equipment_Name,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      letterSpacing: 1.2,
                      color: Colors.blueGrey[900],
                      fontSize: 19.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Sarabun',
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ///////////////////////////////////////////////////////>>>>>>.วันที่ยืม
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "วันที่ยืม : ",
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 7.0),
                    //////////////////////////////////////////////////////////>>>>>.วันที่คืน
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "วันที่คืน : ",
                          style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                /////////////////////////////////////////////////////////////>>>>>โชว์เวลาเริ่มต้น
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          // color: Colors.black,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          article.Borrow_Date,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            letterSpacing: 1.2,
                            color: Colors.blueGrey[900],
                            fontSize: 19.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Sarabun',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 7.0),
                    //////////////////////////////////////////////////////>>>>>>โชว์เวลาสิ้นสุด
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          // color: Colors.black,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          article.Return_Date,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            letterSpacing: 1.2,
                            color: Colors.blueGrey[900],
                            fontSize: 19.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Sarabun',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                /* Divider(
                  thickness: 2,
                  indent: 15,
                  endIndent: 15,
                ), */
                //////////////////////////////////////////////////////////>>>>>>.รายละเอียดโครงการ
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "ชื่อ - นามสกุล : ",
                    style: TextStyle(
                      color: Colors.blueGrey[900],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
               
                /////////////////////////////////////////////////////////////>>>>>โชว์ชื่อ-นามสกุล
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    article.FirstName + ' ' + article.LastName,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      letterSpacing: 1.2,
                      color: Colors.blueGrey[900],
                      fontSize: 19.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Sarabun',
                    ),
                  ),
                ),   
                SizedBox(
                  height: 8.0,
                ),
                ///////////////////////////////////////////////////////>>>>>>อีเมล
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('อีเมล : ',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sarabun',
                          color: Colors.blueGrey[900])),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    article.Email,
                    style: TextStyle(
                      color: Colors.blueGrey[900],
                      fontSize: 19.0,
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'Sarabun',
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                ///////////////////////////////////////////////////////////>>>>>รายละเอียด
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('รายละเอียด : ',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sarabun',
                          color: Colors.blueGrey[900])),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    article.Borrow_Details,
                    style: TextStyle(
                      color: Colors.blueGrey[900],
                      fontSize: 19.0,
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'Sarabun',
                    ),
                  ),
                ),
                
                //////////////////////////////////////////////////////////////>>>>>>.สถานะการจอง
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('สถานะการยืม : ${article.Status}',
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sarabun',
                          color: Colors.blueGrey[900])),
                ),
                SizedBox(
                  height: 8.0,
                ),
                /* Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    article.Status_Book,
                    style: TextStyle(
                      color: Colors.blueGrey[900],
                      fontSize: 20.0,
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'Sarabun',
                    ),
                  ),
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
