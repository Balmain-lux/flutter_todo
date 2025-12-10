import 'package:path/path.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ServiceTodo {
  final Supabase _supabase = Supabase.instance;

  Future<void> addTodo(String title, String description, String s) async {
    try {
      var user_id = _supabase.client.auth.currentUser!.id;

      await _supabase.client.from('Todo').insert({
        'title': title,
        'description': description,
        'image': url,
        'user_id': user_id,
      });
    } catch (e) {
      return;
    }
  }

  Future<void> deleteTodo(dynamic id) async {
    await _supabase.client.from('Todo').delete().eq('id', id);
  }
}
