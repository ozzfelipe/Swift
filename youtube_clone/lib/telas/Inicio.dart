import 'package:flutter/material.dart';
import 'package:youtube_clone/helper/Api.dart';

class Inicio extends StatefulWidget {
  @override
  _IncioState createState() => _IncioState();
}

class _IncioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {

  Api api = Api();
  api.pesquisar('');

    return Container(child: Center(
      child: Text('Inicío',
        style: TextStyle(
          fontSize: 25,
        ),),
    ),
    );
  }
}

