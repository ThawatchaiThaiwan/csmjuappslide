import 'package:appcsmju/APImodel/BorrowReturnPostmodel.dart';
import 'package:appcsmju/api/API_statusBorrow.dart';
import 'package:appcsmju/page/Borrowreturn.dart/Borrow_back.dart';
import 'package:appcsmju/page/Borrowreturn.dart/widgetBorrow.dart';
import 'package:flutter/material.dart';

class ListBorrow extends StatefulWidget {
  const ListBorrow({Key? key}) : super(key: key);

  @override
  State<ListBorrow> createState() => _ListBorrowState();
}

class _ListBorrowState extends State<ListBorrow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'รายการยืมคืน',
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
            : Borrowreturn(),
      ),
      body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(13),
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
              future: BorrowReturnStatusService.getstatusB(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<BorrowReturnPostmodel>> snapshot) {
                if (snapshot.hasData) {
                  List<BorrowReturnPostmodel>? data = snapshot.data;
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
                          cutomStatusBorrow(data[index], context),
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

Widget cutomStatusBorrow(BorrowReturnPostmodel article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Borrowstatus(
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
              article.Equipment_Name,
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
