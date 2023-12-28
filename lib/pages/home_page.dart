import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_todoapp1/provider/todo_provider.dart';
import 'package:flutter_provider_todoapp1/widgets/todo_tile.dart';
import 'package:flutter_provider_todoapp1/models/todo.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final todoProvider = context.read<TodoProvider>();

    debugShowCheckedModeBanner:
    false;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
        backgroundColor: Colors.amber.shade300,
        actions: [
          IconButton(
            onPressed: () => GoRouter.of(context).push('/add'),
            icon: const Icon(
              Icons.add_box_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(child:
          Consumer<TodoProvider>(builder: (context, todoProvider, child) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: todoProvider.todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return TodoTile(todo: todoProvider.todoList[index]);
            });
      })),
    );
  }
}
