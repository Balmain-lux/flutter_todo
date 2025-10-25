import 'package:flutter/material.dart';
import 'package:flutter_todo/drawer.dart';
import 'package:flutter_todo/models/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Список дел"), centerTitle: true),
      body: ListView(
        children: newTodoList!.map((todo) {
          return ListTile(
            title: Text(todo.title!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [Text(todo.description!)],
            ), 
            
            trailing: IconButton(
              onPressed: () {
                newTodoList!.remove(todo);
                setState(() {});
              },
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          );
        }).toList(),
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
