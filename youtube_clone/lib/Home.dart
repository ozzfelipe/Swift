import 'package:flutter/material.dart';
import 'package:youtube_clone/telas/Biblioteca.dart';
import 'package:youtube_clone/telas/EmAlta.dart';
import 'package:youtube_clone/telas/Inicio.dart';
import 'package:youtube_clone/telas/Inscricoes.dart';
import 'package:youtube_clone/helper/Api.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _indiceAtual = 0;

  Api api = Api();

  List<Widget> _telas = [
    Inicio(),
    EmAlta(),
    Inscricoes(),
    Biblioteca(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          'images/youtube.png',
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.videocam), onPressed: null),
          IconButton(icon: Icon(Icons.search), onPressed: null),
          IconButton(icon: Icon(Icons.account_circle), onPressed: null)
        ],
      ),
      body: Center(
        child: _telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: (indice) {
            setState(() {
              _indiceAtual = indice;
            });
          },
          fixedColor: Colors.red,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
//            backgroundColor: Colors.red,
                title: Text('Inicío'),
                icon: Icon(Icons.home)),
            BottomNavigationBarItem(
//            backgroundColor: Colors.orange,
                title: Text('Em alta'),
                icon: Icon(Icons.whatshot)),
            BottomNavigationBarItem(
//            backgroundColor: Colors.blue,
                title: Text('Inscrições'),
                icon: Icon(Icons.subscriptions)),
            BottomNavigationBarItem(
//            backgroundColor: Colors.green,
                title: Text('Biblioteca'),
                icon: Icon(Icons.folder)),
          ]),
    );
  }
}
