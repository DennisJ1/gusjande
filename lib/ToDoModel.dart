import 'package:flutter/material.dart';

class ToDoModel {
  String text;
  bool isDone;

  ToDoModel({this.text, this.isDone = false});
}

class MyState extends ChangeNotifier {
  List<ToDoModel> _list = [];

  List<ToDoModel> get list => _list;

  void addToDo(ToDoModel todo) {
    _list.add(todo);
    notifyListeners();
  }

  List<ToDoModel> filteredList(String filter) {
    if (filter == "Done") {
      return _list.where((todo) => todo.isDone == true).toList();
    } else if (filter == "Not Done") {
      return _list.where((todo) => todo.isDone == false).toList();
    }

    return _list;
  }

  void removeToDo(ToDoModel todo) {
    _list.remove(todo);
    notifyListeners();
  }
}
