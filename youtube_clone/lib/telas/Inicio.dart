import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  @override
  _IncioState createState() => _IncioState();
}

class _IncioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(
      child: Text('Inicío',
        style: TextStyle(
          fontSize: 25,
        ),),
    ),
    );
  }
}

