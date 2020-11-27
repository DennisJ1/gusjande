import 'package:http/http.dart' as http;
import 'dart:convert';
import 'ToDoModel.dart';

class ToDoApi {
  static final String url =
      'https://todoapp-api-vldfm.ondigitalocean.app/todos/';
  static final String key = '30470827-ff77-4589-98f3-db9a7e13b760';

  static Future<List<ToDoModel>> fetchTodo() async {
    http.Response response = await http.get(url + "?key=" + key);

    return responseTolist(response);
  }

  static Future<List<ToDoModel>> createTodo(ToDoModel todomodel) async {
    final http.Response response = await http.post(url + '?key=' + key,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'title': todomodel.text, 'done': todomodel.isDone}));

    return responseTolist(response);
  }

  static Future<List<ToDoModel>> putTodo(ToDoModel todomodel) async {
    http.Response response = await http.put(url + '${todomodel.id}?key=' + key,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'title': todomodel.text, 'done': todomodel.isDone}));
    print(response.statusCode);
    if (response.statusCode != 200) {
      throw Exception('Cannot update item');
    }
    return responseTolist(response);
  }

  static List<ToDoModel> responseTolist(http.Response response) {
    List<ToDoModel> todoList = [];

    var jsonResponse = response.body;

    var obj = jsonDecode(jsonResponse);

    obj
        .map((element) => todoList.add(ToDoModel(
              id: element["id"],
              text: element["title"],
              isDone: element["done"],
            )))
        .toList();

    return todoList;
  }

  static Future<List<ToDoModel>> deleteFromList(ToDoModel todomodel) async {
    http.Response response = await http
        .delete(url + '${todomodel.id}?key=' + key, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    return responseTolist(response);
  }
}
