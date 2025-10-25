import 'package:flutter/material.dart';
import 'package:flutter_todo/auth.dart';
import 'package:flutter_todo/reg.dart';
import 'package:flutter_todo/home.dart';
import 'package:flutter_todo/todo_add.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im91ZGxmdHh6YW5nY3N5ZXN4eGFqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA2NDc0MzUsImV4cCI6MjA3NjIyMzQzNX0.Pg_zFWvXvRALTO8va_YZgemdQnaMKkpsYwmcKcDmU84',
    url: 'https://oudlftxzangcsyesxxaj.supabase.co',
  );

  runApp(const AppTheme());
}

class AppTheme extends StatelessWidget {
  const AppTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: "/",
      routes: {
        "/": (context) => AuthPage(),
        "/reg": (context) => RegPage(),
        "/home": (context) => HomePage(),
        "/todo_add": (context) => TodoAddPage(),
      },
    );
  }
}
