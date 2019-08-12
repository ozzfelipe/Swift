import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<bool> values = List();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lista de tarefas'),
          backgroundColor: Colors.purple,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, indice) {
                return CheckboxListTile(
                  value: values[indice],
                  onChanged: (var values){
                    setState(() {
                      this.values[indice] = values;
                    });

                   /* for(bool value in this.values){
                      print(this.values);
                    }*/
                  },
                  title: Text(indice.toString()),
                );
              },
              itemCount: 5,
            ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.purple,
            child: Icon(Icons.add),
            onPressed: () {
              print('Floating pressionado');
            }),
      ),
    );
  }
}
