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
    return Column(
      children: [
        ListTile(
          leading: Checkbox(
            value: todo.isDone,
            onChanged: (bool value) {
              setState(() {
                todo.isDone = value;
              });
            },
          ),
          title: Text(
            todo.text,
            style: TextStyle(
              fontSize: 24,
              color: Colors.blueGrey,
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Provider.of<MyState>(context, listen: false).removeToDo(todo);
            },
          ),
        ),
      ],
    );
  }
}

// class ToDoView extends StatelessWidget {
//   final ToDoModel todo;
//   ToDoView(this.todo);

// //   Widget build(BuildContext context) {
// //     return Scaffold(appBar: AppBar(), body: Center(child: ToDoWidget(todo)));
// //   }
// // }
// }
