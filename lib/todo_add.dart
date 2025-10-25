import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';

class TodoAddPage extends StatefulWidget {
  const TodoAddPage({super.key});

  @override
  State<TodoAddPage> createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Добавление"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            titleController.clear();
            descriptionController.clear();
            Navigator.popAndPushNamed(context, '/home');
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: titleController,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: 'Заголовок',
              prefixIcon: Icon(Icons.title),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          TextField(
            controller: descriptionController,
            maxLines: 10,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: 'Описание',
              prefixIcon: Icon(Icons.description),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          IconButton(
            onPressed:() => showDatePicker(
              onDatePickerModeChange: (value) {},
              context: context,
              firstDate:DateTime.now(),
              lastDate: DateTime(2025,11,30),
            ),
            icon: Icon(Icons.calendar_month),
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.065,
            width: MediaQuery.of(context).size.width * 0.7,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.yellow),
                foregroundColor: WidgetStatePropertyAll(Colors.black),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              onPressed: () async {
                Todo todo = Todo();
                todo.title = titleController.text;
                todo.description = descriptionController.text;
                todo.dateTime = DateTime.now();
                todo.dateTime = date;
                newTodoList!.add(todo);
                Navigator.popAndPushNamed(context, '/home');
              },
              child: Text('Добавить'),
            ),
          ),
        ],
      ),
    );
  }
}
