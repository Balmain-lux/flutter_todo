import 'package:supabase_flutter/supabase_flutter.dart';

class ServiceUser {
  final Supabase _supabase = Supabase.instance;

  Future<void> userAdd(String name, String email, String password) async {
    try {
      await _supabase.client.from('Users').insert({
        'name': name,
        'password': password,
        'email': email,
      });
    } catch (e) {
      return null;
    }
  }

  Future<void> userEdit(String name, String email, String password) async {
    try {
      await _supabase.client
          .from('Users')
          .update({'name': name, 'password': password, 'email': email})
          .eq('id', '');
    } catch (e) {
      return null;
    }
  }
}
