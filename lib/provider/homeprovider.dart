import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_app/secrets/secrets.dart';

class HomeProvider extends ChangeNotifier {
  void logout() async {
    try {
      final response = await http.post(
        Uri.parse(Secrets.logoutUrl),
        headers: {
          "Accept": "application/json",
          // "Authorization": "Bearer $token",
        },
      );
    } catch (e) {}
  }
}
