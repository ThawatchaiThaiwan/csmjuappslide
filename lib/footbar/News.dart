import 'package:appcsmju/APImodel/apinew.dart';
import 'package:appcsmju/api/apinew_foot.dart';
import 'package:appcsmju/model/newsmodel/customListTile.dart';
import 'package:flutter/material.dart';


class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "ข่าวสาร",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.blueGrey[900],fontSize: 27,fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.person),
          color: Colors.blueGrey[900],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_active),
            color: Colors.blueGrey[900],
          ),
        ],
      ),
      body: FutureBuilder(
        ///////////////////////////////////////////////////////////>>>>>>>>>>แสดงหน้าข่าว
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Apinew>> snapshot) {
          if (snapshot.hasData) {
            
            List<Apinew>? data = snapshot.data;
            return ListView.builder(
              
              itemCount: data!.length,
              itemBuilder: (context, index) =>
                  customListTile(data[index], context),
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
