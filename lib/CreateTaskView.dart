import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ToDoModel.dart';

class CreateTaskView extends StatefulWidget {
  final ToDoModel todo;

  CreateTaskView(this.todo);

  @override
  State<StatefulWidget> createState() {
    return CreateTaskViewState(todo);
  }
}

class CreateTaskViewState extends State<CreateTaskView> {
  String text;

  TextEditingController textEditingController;

  CreateTaskViewState(ToDoModel todo) {
    this.text = todo.text;

    textEditingController = TextEditingController();

    textEditingController.addListener(() {
      setState(() {
        text = textEditingController.text;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIG169 TODO'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _toDoInputField(),
            _addActivityButton(),
          ],
        ),
      ),
    );
  }

  Widget _toDoInputField() {
    return Container(
      margin: EdgeInsets.only(left: 40, top: 70, right: 40),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            width: 3.0,
            color: Colors.blue[400],
          )),
          hintText: 'What are you going to do?',
        ),
      ),
    );
  }

  Widget _addActivityButton() {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(50.0),
        child: RaisedButton(
          onPressed: () {
            Provider.of<MyState>(context, listen: false)
                .addToDo(ToDoModel(text: textEditingController.text));
            Navigator.pop(context, ToDoModel(text: textEditingController.text));
          },
          // disabledColor: Color(0xFFFFFFFF),
          color: Color(0xFFFFFFFF),
          child: Text('+ Add',
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue[400],
              )),
        ));
  }
}
