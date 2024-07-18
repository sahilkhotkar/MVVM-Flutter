import 'package:flutter/material.dart';
import 'package:todo/helpers/network_helper.dart';
import 'package:todo/models/TodoModel.dart';
import 'package:todo/services/services.dart';

class TodoViewModel extends ChangeNotifier {
  List<TodoModel> _todoModel = [];
  List<TodoModel> get todoModel => _todoModel;
  setTodoModel(List<TodoModel> todoModel) {
    _todoModel = todoModel;
    notifyListeners();
  }

  getTodoResponse() async {
    final response = await ServicesClass.getTodoData();
    if (response is Success) {
      setTodoModel(response.response as List<TodoModel>);
    } else if(response is Failure){
      print(response.statusCode);
    }
  }
}
