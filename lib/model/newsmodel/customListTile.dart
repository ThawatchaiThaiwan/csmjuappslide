import 'package:appcsmju/APImodel/apinew.dart';
import 'package:appcsmju/model/newsmodel/articles_details_page.dart';

import 'package:flutter/material.dart';

Widget customListTile(Apinew article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(
                    article: article,
                  )));
    },
    child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ////////////////////////////////////////////////////////>>>>>>>รูปภาพ
          Container(
            height: 220.0,
            width: double.infinity,
            decoration: BoxDecoration(
              //let's add the height
              image: DecorationImage(
                  image: NetworkImage(article.newsPicture), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ////////////////////////////////////////////////////////////////>>>>.หัวข้อ(title)
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Text(
              article.newsTitle,
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Sarabun',
              ),
            ),
          ),
          ////////////////////////////////////////////////////////////>>>>>>.วันที่
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Text(
              article.newsDate,
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Sarabun',
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    ),
  );
}
