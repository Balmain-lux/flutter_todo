import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_todo/database/service_todo.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';

class TodoAddPage extends StatefulWidget {
  const TodoAddPage({super.key});

  @override
  State<TodoAddPage> createState() => _TodoAddPageState();
}

class _TodoAddPageState extends State<TodoAddPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? date;
  ServiceTodo serviceTodo = ServiceTodo();
  File? _selectFile;
  XFile? _file;
  String? url;
  Future selectImageGallery() async {
    final returnImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _selectFile = File(returnImage!.path);
      _file = returnImage;
    });
  }

  uploadImage() async {
    await StorageCloud().uploadImage(_file!);
  }

  downloadUrl() async {
    try {
      final fileName = path.basename(_file!.path);
      final image = Supabase.instance.client.storage
          .from('storage')
          .getPublicUrl(fileName);

      setState(() {
        url = image;
      });
    } catch (e) {
      return;
    }
  }

  void toastShowNull() {
    MotionToast toast = MotionToast.error(description: Text("Заполните поля"));
    toast.show(context);
  }

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
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () => selectImageGallery(),
              icon: (Icon(Icons.image)),
            ),
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
                if (titleController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty &&
                    url == null) {
                  await uploadImage();
                  await Future.delayed(Duration(seconds: 4));
                  downloadUrl();

                  await serviceTodo.addTodo(
                    titleController.text,
                    descriptionController.text,
                    url!,
                  );
                  Navigator.popAndPushNamed(context, '/home');
                } else {
                  toastShowNull();
                }
              },
              child: Text('Добавить'),
            ),
          ),
        ],
      ),
    );
  }
}
