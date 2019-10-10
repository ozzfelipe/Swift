import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatzappflutter/telas/AbaContatos.dart';
import 'package:whatzappflutter/telas/AbaConversas.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  String _emailUsuario = '';
  TabController _tabController;
  List<String> itensMenus = [
    ''
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WhatsApp Clone Flutter'),
          bottom: TabBar(
              indicatorWeight: 4,
              labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              controller: _tabController,
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(text: 'Conversas'),
                Tab(text: 'Contatos'),
              ]),
          actions: <Widget>[
            PopupMenuButton<String>(
              onCanceled: _escolhaMenuItem(),
              itemBuilder: (context){

              },
            )
          ],
        ),
        body: TabBarView(controller: _tabController, children: <Widget>[
          AbaConversas(),
          AbaContatos(),
        ]));
  }

  _escolhaMenuItem(String itemEscolhido){
    print('item escolhido:'+ itemEscolhido);
  }

  Future _recuperarEmail() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();

    setState(() {
      _emailUsuario = firebaseUser.email;
    });
  }

  @override
  void initState() {
    _recuperarEmail();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
}
