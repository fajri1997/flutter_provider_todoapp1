import 'package:flutter/material.dart';
import 'package:flutter_provider_todoapp1/provider/todo_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_provider_todoapp1/pages/add_page.dart';
import 'package:flutter_provider_todoapp1/pages/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => TodoProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/add',
        builder: (context, state) => AddPage(),
      ),
    ],
  );
}
