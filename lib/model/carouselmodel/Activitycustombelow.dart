import 'package:appcsmju/APImodel/Activity.dart';
import 'package:appcsmju/model/carouselmodel/Activitybelow.dart';
import 'package:flutter/material.dart';

Widget customActivityBelow(Activity article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Activitybelow(
                    article: article,
                  )));
    },
    child: Container(
      margin: EdgeInsets.fromLTRB(1, 5, 1, 5),
      padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
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
          
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Text(
              article.Activitypic_Title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Sarabun',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Text(
              article.Activity_Date,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Sarabun',
              ),
            ),
          ),
          SizedBox(
            height: 1.0,
          ),
        ],
      ),
    ),
  );
}
