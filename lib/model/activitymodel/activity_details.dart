//Now let's create the article details page

import 'package:appcsmju/APImodel/Activity.dart';

import 'package:appcsmju/footbar/News.dart';

import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  final Activity activity;

  ActivityPage({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          ' รายละเอียดกิจกรรม',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 27.0,
              fontFamily: 'Sarabun'),
        ),
        titleTextStyle: TextStyle(color: Colors.black),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : News(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 245.0,
              width: double.infinity,
              decoration: BoxDecoration(
                //let's add the height
                image: DecorationImage(
                    image: NetworkImage(activity.Activity_Picture),
                    fit: BoxFit.cover),
                // borderRadius: BorderRadius.circular(1.0),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                // color: Colors.black,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                activity.Activitypic_Title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sarabun',
                ),
              ),
            ),
            Divider(
              thickness: 5,
              indent: 20,
              endIndent: 20,
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                // color: Colors.black,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                activity.Activity_Date,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  //fontWeight: FontWeight.bold,
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
}
