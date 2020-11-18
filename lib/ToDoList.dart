import 'package:flutter/material.dart';

import './SecondView.dart';

class ToDoList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIG169 TODO'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {},
          ),
        ],
      ),
      body: _list(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondView()));
        },
      ),
    );
  }

  Widget _list() {
    return ListView(
      children: [
        _item('Städa'),
        _item('Diska'),
        _item('Studera'),
      ],
    );
  }

  Widget _item(text) {
    return CheckboxListTile(
        //Hela widgeten måste bytas ut nästa vecka
        title: Text(text,
            style: TextStyle(
              fontSize: 24,
              color: Colors.blueGrey,
            )),
        secondary: Icon(Icons.delete),
        controlAffinity: ListTileControlAffinity.leading,
        value: false,
        onChanged: (null)); 
  }
}

