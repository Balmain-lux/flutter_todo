import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_todo/database/service_todo.dart';
import 'package:flutter_todo/drawer.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ServiceTodo serviceTodo = ServiceTodo();

  Widget tileTodo(BuildContext context, dynamic docs) {
    return ListTile(
      leading: Icon(Icons.list),
      title: Text(docs['title']),
      subtitle: Text(docs['description']),
      trailing: IconButton(
        onPressed: () async {
          await serviceTodo.deleteTodo(docs['id']);
        },
        icon: Icon(Icons.delete, color: Colors.red),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Список дел"), centerTitle: true),
      body: StreamBuilder(
        stream: Supabase.instance.client
            .from('Todo')
            .stream(primaryKey: ['id']),
        builder: (context, snapshot) {
          var todo = snapshot.data!;

          return ListView.builder(
            itemCount: todo.length,
            itemBuilder: (context, index) {
              return tileTodo(context, todo[index]);
            },
          );
        },
      ),
      drawer: DrawerPage(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {
          Navigator.popAndPushNamed(context, '/todo_add');
        },
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
