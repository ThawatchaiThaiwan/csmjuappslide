import 'dart:convert';

import 'package:appcsmju/footbar/Calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List users = [];
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
  }

  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url = 'https://wwwdev.csmju.com/api/newsapp';
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        users = items;
        isLoading = false;
      });
    } else {
      users = [];
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "ข่าว",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.keyboard_backspace),
          color: Colors.black,
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (users.contains(null) || users.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
      ));
    }
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return getCard(users[index]);
        });
  }

  Widget getCard(item) {
    var fullName = item['News_Title'] +
        " " +
        item['News_Detail'] +
        " " +
        item['News_Date'];

    var picturenewUrl = item['News_Picture'];
    return Card(

      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListTile(
          title: Row(
            children: <Widget>[
              Container(
                width: 80,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(picturenewUrl))),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 150,
                      child: Text(
                        fullName,
                        style: TextStyle(fontSize: 12),
                      )),
                  // ignore: deprecated_member_use
                  FlatButton(
                      onPressed: () {},
                      child: Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                            color: Color(0xff4baef5),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff4baef5),
                              blurRadius: 3,
                              offset: Offset(0, 4),
                            ),
                          ],
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff4baef5), Color(0xff4baef5)],
                          ),
                        ),
                        child: SizedBox(
                          width: 20,
                          height: 12,
                          child: Text(
                            "อ่านเพิ่มเติม",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xfff9f6f6),
                              fontSize: 15,
                            ),
                          ),
                        ),
                      )),

                  /* SizedBox(height: 10,),
                  Text(email.toString(),style: TextStyle(color: Colors.grey),) */
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
