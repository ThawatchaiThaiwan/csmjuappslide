
import 'package:appcsmju/APImodel/ReserveRoommodel.dart';
import 'package:appcsmju/api/API_statusReserve.dart.dart';
import 'package:appcsmju/page/ReserveRoom/ReserveRoom.dart';
import 'package:appcsmju/page/ReserveRoom/WidgetReserve.dart';
import 'package:flutter/material.dart';

class ListReserve extends StatefulWidget {
  const ListReserve({Key? key}) : super(key: key);

  @override
  State<ListReserve> createState() => _ListReserveState();
}

class _ListReserveState extends State<ListReserve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'รายการจองห้องเรียน',
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
            : ReserveRoom1(),
      ),
      body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(13),
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
              future: ReserveRoomStatusService.getstatus(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<ReserveRoommodel>> snapshot) {
                if (snapshot.hasData) {
                  List<ReserveRoommodel>? data = snapshot.data;
                  return Align(
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                      reverse: true,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      itemCount: data!.length < 5 ? data.length : 5,
                      itemBuilder: (context, index) =>
                          cutomStatusReserve(data[index], context),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )),
    );
  }
}

Widget cutomStatusReserve(ReserveRoommodel article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Reservedeteil(
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
              article.Classroom_Name,
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
              article.Status_Book,
              style: TextStyle(
                color: Color(0xff24a878) , 
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
