import 'package:appcsmju/footbar/Another.dart';
import 'package:flutter/material.dart';

class Activity_log extends StatefulWidget {
  const Activity_log({ Key? key }) : super(key: key);

  @override
  _Activity_logState createState() => _Activity_logState();
}

class _Activity_logState extends State<Activity_log> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[75],
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'บันทึกกิจกรรม',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
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
        ));
  }
}