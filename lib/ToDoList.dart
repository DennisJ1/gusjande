import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ToDoModel.dart';

class ToDoList extends StatefulWidget {
  final List<ToDoModel> list;

  ToDoList(this.list);

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (context, index) =>
            _toDoItem(widget.list[index], context));
    //      children: list.map((todo) => _toDoItem(context, todo)).toList());
  }

  Widget _toDoItem(ToDoModel todo, context) {
    var state = Provider.of<MyState>(context, listen: false);
    return Column(
      children: [
        ListTile(
          leading: Checkbox(
            value: todo.isDone,
            onChanged: (bool value) {
              setState(() {
                todo.isDone = value;
                state.updateList(todo);
              });
            },
          ),
          title: Text(
            todo.text,
            style: TextStyle(
              decoration:
                  todo.isDone == true ? TextDecoration.lineThrough : null,
              fontSize: 24,
              color: Colors.blueGrey,
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              state.removeItem(todo);
              //Provider.of<MyState>(context, listen: false).removeToDo(todo);
            },
          ),
        ),
      ],
    );
  }
}
