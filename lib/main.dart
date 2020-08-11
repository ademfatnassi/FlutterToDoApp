import 'package:flutter/material.dart';

import './models/todo.dart';
import './widgets/todo_list.dart';
import './widgets/chart.dart';
import './widgets/add_todo.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.greenAccent,
        textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            subtitle: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
            button: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Todo> _todoList = [
    Todo(
      id: 't1',
      title: 'Learn more flutter',
      description: 'Watch Max course and learn Coding Flutter by creating apps',
      date: DateTime.now(),
    ),
    Todo(
      id: 't2',
      title: 'Learn C# basics',
      description: 'Watch C# course and learn Coding .',
      date: DateTime.now(),
    ),
  ];

  void _addNewTd(String txTitle, String txDescription) {
    final newTx = Todo(
        title: txTitle,
        description: txDescription,
        date: DateTime.now(),
        id: DateTime.now().toIso8601String());
    setState(() {
      _todoList.add(newTx);
    });
  }

  void _deleteTd(String tId) {
    setState(() {
      _todoList.removeWhere((tx) => tx.id == tId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.library_add),
            onPressed: () {
              print('prip...');
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(),
            AddTodo(_addNewTd),
            TodoList(_todoList, _deleteTd),
          ],
        ),
      ),
    );
  }
}
