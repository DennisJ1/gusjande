import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './ToDoList.dart';
import './SecondView.dart';
import './ToDoModel.dart';

class ToDoListView extends StatefulWidget {
  @override
  _ToDoListViewState createState() => _ToDoListViewState();
}

class _ToDoListViewState extends State<ToDoListView> {
  final List<String> _filterList = ["All", "Done", "Not Done"];

  String _filterValue = "All";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIG169 TODO'),
        actions: [
          PopupMenuButton<String>(onSelected: (String value) {
            setState(() {
              _filterValue = value;
              print(_filterValue);
            });
          }, itemBuilder: (context) {
            return _filterList
                .map((filter) =>
                    PopupMenuItem(value: filter, child: Text(filter)))
                .toList();
          }),
        ],
      ),
      body: Consumer<MyState>(
          builder: (context, state, child) =>
              ToDoList(state.filteredList(_filterValue))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => SecondView(ToDoModel())));
          // if (newToDo != null) {
          //   Provider.of<MyState>(context, listen: false).addToDo(newToDo);
          // }
        },
      ),
    );
  }
}
