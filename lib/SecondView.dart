import 'package:flutter/material.dart';


class SecondView extends StatelessWidget {
  @override
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
          onPressed: () {},
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