import 'package:flutter/material.dart';

import './SecondView.dart';
import './ToDoList.dart';

void main() {
 runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoList(),
    );
  }
}

