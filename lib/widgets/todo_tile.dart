import 'package:flutter/material.dart';
import 'package:flutter_provider_todoapp1/models/todo.dart';
import 'package:flutter_provider_todoapp1/provider/todo_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_provider_todoapp1/models/todo.dart';
import 'package:provider/provider.dart';

class TodoTile extends StatefulWidget {
  final Todo todo;

  TodoTile({required this.todo});

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:
    false;
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: ListTile(
          title: Text(
            widget.todo.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Checkbox(
            value: widget.todo.done,
            onChanged: (newValue) {
              Provider.of<TodoProvider>(context, listen: false)
                  .toggleDone(widget.todo.id);
            },
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.black),
            onPressed: () {
              Provider.of<TodoProvider>(context, listen: false)
                  .deleteTodo(widget.todo.id);
            },
          ),
        ),
      ),
    );
  }
}
