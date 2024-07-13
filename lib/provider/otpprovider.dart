import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_app/secrets/secrets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpProvider extends ChangeNotifier {
  String logintype = '';
  String msg = '';

  void typeofLogin(String type) {
    logintype = type;
    notifyListeners();
    print(logintype);
  }

  Future<void> studentOtp(String code, String phone) async {
    String url = Secrets.studentOtpUrl;
    print('student');
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          "tel_code": code,
          "phone": phone,
        },
        headers: {
          "Accept": "application/json",
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        msg = data['message'];
        notifyListeners();
        print(msg);
      } else {
        msg = '${data['message']}. Please try again!';
        notifyListeners();
        print('$msg 200');
      }
    } catch (e) {
      msg = '${e.toString()}. Please try again!';
      notifyListeners();
      print(msg);
    }
  }

  Future<void> agentOtp(String code, String phone) async {
    print('student');
    String url = Secrets.agentOtpUrl;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          "tel_code": code,
          "phone": phone,
        },
        headers: {
          "Accept": "application/json",
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        msg = data['message'];
        notifyListeners();
        print(msg);
      } else {
        msg = '${data['message']}. Please try again!';
        notifyListeners();
        print('$msg 200');
      }
    } catch (e) {
      msg = '${e.toString()}. Please try again!';
      notifyListeners();
      print(msg);
    }
  }

  Future<void> resendOtp(String phone) async {
    try {
      String url = Secrets.resendOtpUrl;
      final response = await http.post(
        Uri.parse(url),
        body: {
          "phone": phone,
        },
        headers: {
          "Accept": "application/json",
        },
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        msg = data['message'];
        notifyListeners();
        print(msg);
      } else {
        msg = '${data['message']}. Please try again!';
        notifyListeners();
        print(msg);
      }
    } catch (e) {
      msg = '${e.toString()}. Please try again!';
      notifyListeners();
      print(msg);
    }
  }

  Future<void> verifyOtp(String code, String phone) async {
    try {
      final response = await http.post(
        Uri.parse(Secrets.verifyOtpUrl),
        body: {
          "code": code,
          "phone": phone,
        },
        headers: {
          "Accept": "application/json",
        },
      );
      final data = jsonDecode(response.body);
      print(data);
      if (response.statusCode == 200) {
        msg = data['message'];
        // await sharedPref.setString('token', data['data']['access_token'].toString());
        // print(data['data']['access_token'].toString());
        notifyListeners();
        print(msg);
      } else {
        msg = '${data['message']}. Please try again!';
        notifyListeners();
        print(msg);
      }
    } catch (e) {
      msg = '${e.toString()}. Please try again!';
      notifyListeners();
      print(msg);
    }
  }
}
