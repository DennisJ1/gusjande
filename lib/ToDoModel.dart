import 'package:flutter/material.dart';
import 'ToDoAPI.dart';

class ToDoModel {
  String id;
  String text;
  bool isDone;

  ToDoModel({this.id, this.text, this.isDone = false});
}

class MyState extends ChangeNotifier {
  List<ToDoModel> _list = [];

  List<ToDoModel> get list => _list;

  MyState() {
    _initializeList();
  }

  void addToDo(ToDoModel todo) async {
    _list = await ToDoApi.createTodo(todo);
    // _list.add(todo);
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

  void _initializeList() async {
    this._list = await ToDoApi.fetchTodo();
    notifyListeners();
  }

  void removeItem(ToDoModel todo) async {
    _list = await ToDoApi.deleteFromList(todo);
    notifyListeners();
  }

  void updateList(ToDoModel todo) async {
    _list = await ToDoApi.putTodo(todo);
    notifyListeners();
  }
  // void removeToDo(ToDoModel todo) {
  //   _list.remove(todo);
  //   notifyListeners();
  // }
}
