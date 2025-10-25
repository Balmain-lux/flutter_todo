import 'package:flutter_todo/database/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Services {
  final Supabase _supabase = Supabase.instance;

  Future<Users?> authDatabase(String email, String password)async{
    try{
      var result = await _supabase.client.auth.signInWithPassword(
        password: password, 
        email: email
        );
        User user = result.user!;
        return Users.fromSupabase(user);
    } catch (e) {
      return null;
    }
  }

  Future<Users?> regDatabase(String email, String password) async {
    try {
      var result = await _supabase.client.auth.signUp(
        password: password,
        email: email,
      );
      User user = result.user!;
      return Users.fromSupabase(user);
    } catch (e) {
      return null;
    }
  }
  Future <void> logOut() async{
    return await _supabase.client.auth.signOut();
  }
}