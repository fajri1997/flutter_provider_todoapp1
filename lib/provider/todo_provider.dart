import 'package:flutter/foundation.dart';
import 'package:flutter_provider_todoapp1/models/todo.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_provider_todoapp1/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todoList = [
    Todo(id: 50, title: 'title'),
    Todo(id: 600, title: "test")
  ];

  void addTodo(String title) {
    var todo =
        Todo(id: todoList.isNotEmpty ? todoList.length + 1 : 1, title: title);

    todoList.insert(0, todo);
    notifyListeners();
  }

  void checkTodo(int id) {
    todoList.forEach((todo) {
      if (todo.id == id) {
        todo.done = !todo.done;
      }
    });
    notifyListeners();
    // todoList[id].id = todoList.indexWhere((done) => true);
  }

  void deleteTodo(int id) {}

  void toggleDone(int id) {}
}
