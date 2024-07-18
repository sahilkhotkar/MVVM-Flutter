import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/view-models/todo_vm.dart';
import 'package:todo/views/home.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TodoViewModel())],
      child: const MaterialApp(
        home: Home(),
      )));
}
