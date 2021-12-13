import 'package:appcsmju/footbar/Another.dart';
import 'package:flutter/material.dart';

class Borrow_Back extends StatefulWidget {
  @override
  _Borrow_BackState createState() => _Borrow_BackState();
}

class _Borrow_BackState extends State<Borrow_Back> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[75],
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'ยืมคืน',
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
