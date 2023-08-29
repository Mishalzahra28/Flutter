import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  late String _token;
  late DateTime _expiryDate;
  late String _userId;

  Future<void> signup(String email, String password) async {
    final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyA5mIPLn6BMRlKgqF8KVrU2aEMRW6RxiBA");
    try {
      final response = await http.post(url,
          body: jsonEncode({
            "email": email,
            "password": password,
            "returnSecureToken": true
          }));
      print(jsonDecode(response.body));
      final responseData = jsonDecode(response.body);
      // if(responseData['error'] != null){
      //   throw
      // }
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyA5mIPLn6BMRlKgqF8KVrU2aEMRW6RxiBA");
    try {
      final response = await http.post(url,
          body: jsonEncode({
            "email": email,
            "password": password,
            "returnSecureToken": true
          }));
      print(jsonDecode(response.body));
    } catch (error) {
      throw error;
    }
  }
}
