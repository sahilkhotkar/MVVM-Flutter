import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/view-models/todo_vm.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    TodoViewModel todo = Provider.of<TodoViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Todos"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            todo.getTodoResponse();
          }, child: const Text("Get Data")),
          Expanded(
            child: ListView.builder(shrinkWrap: true,itemBuilder: (context,i){
              return Text(todo.todoModel[i].id.toString() ?? "no data");
            },itemCount: todo.todoModel.length,),
          )
        ],
      ),
    );
  }
}