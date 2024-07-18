import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo/helpers/network_helper.dart';
import 'package:todo/models/TodoModel.dart';

class ServicesClass {
  static Future<Object> getTodoData() async {
    var url = "https://jsonplaceholder.typicode.com/todos";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var decodedReponse = jsonDecode(response.body);
      if (decodedReponse is List) {
        List<TodoModel> todoList =
            decodedReponse.map((item) => TodoModel.fromJson(item)).toList();
        return Success(statusCode: 200, response: todoList);
      } else if (decodedReponse is Map<String, dynamic>) {
        TodoModel todoModel = TodoModel.fromJson(decodedReponse);
        return Success(statusCode: 200, response: [todoModel]);
      } else {
        return Failure(
            statusCode: response.statusCode, response: "Invalid Response");
      }
    }
    return Failure(
        statusCode: response.statusCode, response: "Invalid Response");
  }
}
