//Now let's create the article details page

import 'package:appcsmju/APImodel/apinew.dart';
import 'package:appcsmju/footbar/News.dart';

import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  final Apinew article;

  ArticlePage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          ' รายละเอียดข่าว',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blueGrey[900],
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'Sarabun'),
        ),
        //titleTextStyle: TextStyle(color: Colors.blueGrey[900]),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: Colors.blueGrey[900],
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : News(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /////////////////////////////////////////////////////////////>>>>รูปภาพ
            Container(
              height: 245.0,
              width: double.infinity,
              decoration: BoxDecoration(
                //let's add the height
                image: DecorationImage(
                    image: NetworkImage(article.newsPicture),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Color(0xff24a878),
                  width: 2.0,
                ),
                // borderRadius: BorderRadius.circular(1.0),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            //////////////////////////////////////////////////////////>>>>>>.หัวข้อ(title)
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                // color: Colors.black,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                article.newsTitle,
                textAlign: TextAlign.start,
                style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.blueGrey[900],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sarabun',
                ),
              ),
            ),
            Divider(
              thickness: 3,
              indent: 15,
              endIndent: 15,
              color: Color(0xff24a878),
            ),
            //////////////////////////////////////////////////////////>>>>>>>รายละเอียด
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                // color: Colors.black,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                "รายละเอียด",
                textAlign: TextAlign.start,
                style: TextStyle(
                  letterSpacing: 1.2,
                  color: Colors.blueGrey[900],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sarabun',
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                // color: Colors.black,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                article.newsDetail,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  letterSpacing: 0.98,
                  color: Colors.blueGrey[900],
                  fontSize: 18,
                  //fontWeight: FontWeight.bold,
                  fontFamily: 'Sarabun',
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            ///////////////////////////////////////////////////////////////>>>>ไฟล์แนบ
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                // color: Colors.black,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                "ไฟล์",
                textAlign: TextAlign.start,
                style: TextStyle(
                  letterSpacing: 1.2,
                  color: Colors.blueGrey[900],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sarabun',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                // color: Colors.black,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                article.newsFile,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  letterSpacing: 0.98,
                  color: Colors.blueGrey[900],
                  fontSize: 18,
                  //fontWeight: FontWeight.bold,
                  fontFamily: 'Sarabun',
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            ///////////////////////////////////////////////////////////////ประเภทข่าว
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                // color: Colors.black,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                "ประเภทข่าว",
                textAlign: TextAlign.start,
                style: TextStyle(
                  letterSpacing: 1.2,
                  color: Colors.blueGrey[900],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sarabun',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                // color: Colors.black,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                article.newsType,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  letterSpacing: 0.98,
                  color: Colors.blueGrey[900],
                  fontSize: 18,
                  //fontWeight: FontWeight.bold,
                  fontFamily: 'Sarabun',
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            /////////////////////////////////////////////////////////////>>>>>ลิงค์ข่าว
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                // color: Colors.black,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                "ลิงค์เกี่ยวข้อง",
                textAlign: TextAlign.start,
                style: TextStyle(
                  letterSpacing: 1.2,
                  color: Colors.blueGrey[900],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sarabun',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                // color: Colors.black,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                article.newsLinks,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  letterSpacing: 0.98,
                  color: Colors.blueGrey[900],
                  fontSize: 18,
                  //fontWeight: FontWeight.bold,
                  fontFamily: 'Sarabun',
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            ///////////////////////////////////////////////////////////////วันที่ประกาศ
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "วันที่ : ",
                        style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          //fontWeight: FontWeight.bold,
                          fontFamily: 'Sarabun',
                        ),
                      ),
                      Text(
                       article.newsDate,
                        style: TextStyle(
                          color: Colors.blueGrey[900],
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          fontFamily: 'Sarabun',
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "เวลา ",
                      style: TextStyle(
                        color: Colors.blueGrey[900],
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Sarabun',
                      ),
                    ),
                    Text(
                      article.newsTime,
                      style: TextStyle(
                        color: Colors.blueGrey[900],
                        fontSize: 18,
                        //fontWeight: FontWeight.bold,
                        fontFamily: 'Sarabun',
                      ),
                    ),
                    
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
