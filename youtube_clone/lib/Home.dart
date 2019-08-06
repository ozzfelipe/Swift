import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('images/youtube.png',
          width: 98,
          height: 22,),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.videocam),
            onPressed: null),
        IconButton(
            icon: Icon(Icons.search),
            onPressed: null),
        IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: null)
      ],
    )
    ,
    );
  }
}
