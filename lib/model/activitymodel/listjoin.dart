import 'package:appcsmju/APImodel/ActivitypostModel.dart';
import 'package:appcsmju/api/API_statusActivity.dart';
import 'package:appcsmju/footbar/Foot.dart';
import 'package:appcsmju/model/activitymodel/activitystatus.dart';
import 'package:flutter/material.dart';

class Listjoin extends StatefulWidget {
  const Listjoin({Key? key} ) : super(key: key);

  @override
  State<Listjoin> createState() => _ListjoinState();
}

class _ListjoinState extends State<Listjoin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'รายการเข้าร่วมกิจกรรม',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blueGrey[900],
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              fontFamily: 'Sarabun'),
        ),
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: Colors.blueGrey[800],
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : Foot(),
      ),
      body: Container(
        padding: EdgeInsets.all(13),
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: ActivityStatusService.getstatusA(),
          builder: (BuildContext context,
              AsyncSnapshot<List<ActivityPostmodel>> snapshot) {
            if (snapshot.hasData) {
              List<ActivityPostmodel>? data = snapshot.data;
              return SingleChildScrollView(
                //alignment: Alignment.bottomCenter,
                child: ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  itemCount: data!.length,
                  itemBuilder: (context, index) =>
                      cutomStatusActivity(data[index], context),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

Widget cutomStatusActivity(ActivityPostmodel article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ActivityStatus(
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
          ///////////////////////////////////////////////////////////>>>>>>.หัวข้อ
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Text(
              article.Activity_Title,
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Sarabun',
              ),
            ),
          ),
          /////////////////////////////////////////////////////////////>>>>>>.วันที่
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Text(
              article.Status,
              style: TextStyle(
                color: Color(0xff24a878),
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
