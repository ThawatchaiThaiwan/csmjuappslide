import 'package:appcsmju/APImodel/Activity.dart';
import 'package:appcsmju/api/API_activity.dart';

import 'package:appcsmju/footbar/Another.dart';
import 'package:appcsmju/model/activitymodel/customListactivity.dart';
import 'package:flutter/material.dart';

class ActivityAnoter extends StatefulWidget {
  const ActivityAnoter({Key? key}) : super(key: key);

  @override
  _ActivityAnoterState createState() => _ActivityAnoterState();
}

class _ActivityAnoterState extends State<ActivityAnoter> {
  ActivityApiService client = ActivityApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "รูปภาพกิจกรรม",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black,
          fontSize: 27,
          fontWeight: FontWeight.bold),
        ),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : Another(),
      ),
      body: FutureBuilder(
        future: ActivityApiService.getsActivity(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Activity>> snapshot) {
          if (snapshot.hasData) {
            List<Activity>? data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) =>
                  customListactivity(data[index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
