import 'package:appcsmju/footbar/Another.dart';
import 'package:flutter/material.dart';

class Appeal extends StatefulWidget {
  @override
  _AppealState createState() => _AppealState();
}

class _AppealState extends State<Appeal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[75],
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'ร้องเรียน',
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
