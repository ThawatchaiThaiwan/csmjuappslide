import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({ Key? key }) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey[75],
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("ปฏิทินกิจกรรม",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),),
          
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.keyboard_backspace),
            color: Colors.black,
        ),
        actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_active),
              color: Colors.black,
            ),
          ],
          
        ),
      
    );
  }
}