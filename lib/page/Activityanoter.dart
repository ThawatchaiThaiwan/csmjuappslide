import 'package:appcsmju/APImodel/Activity.dart';
import 'package:appcsmju/api/API_activity.dart';

import 'package:appcsmju/footbar/Another.dart';
import 'package:appcsmju/model/activitymodel/customListactivity.dart';
import 'package:appcsmju/model/activitymodel/listjoin.dart';
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
          "โครงการทั้งหมด",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blueGrey[900],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: Colors.blueGrey[800],
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : Another(),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_task_rounded,
              color: Colors.blueGrey[800],
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Listjoin()));
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: ActivityApiService.getsActivity(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Activity>> snapshot) {
          if (snapshot.hasData) {
            List<Activity>? data = snapshot.data;
            return SingleChildScrollView(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                shrinkWrap: true,
                reverse: true,
                itemCount: data!.length,
                itemBuilder: (context, index) =>
                    customListactivity(data[index], context),
              ),
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
