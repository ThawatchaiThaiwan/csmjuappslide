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
            style: TextStyle(color: Colors.blueGrey[900]),
          ),
          leading: Navigator.canPop(context)
              ? IconButton(
                  icon: Icon(
                    Icons.keyboard_backspace,
                    color: Colors.blueGrey[900],
                    
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : Another(),
        ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          height: 1100,
          width: 405,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
            
            
          ),
        ),
      ),
        );
  }
}
