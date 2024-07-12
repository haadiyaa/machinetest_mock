import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_app/constants/constants.dart';
import 'package:login_app/secrets/secrets.dart';

class OtpProvider extends ChangeNotifier {
  String logintype = '';
  String msg = '';

  void typeofLogin(String type) {
    logintype = type;
    notifyListeners();
    print(logintype);
  }

  Future<void> sendOtp(String code, String phone) async {
    String url = '';
    try {
      if (logintype == Constants.studentt) {
        url = Secrets.studentOtpUrl;
      } else if (logintype == Constants.agent) {
        url = Secrets.agentOtpUrl;
      }

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
        msg = data['message'];
        notifyListeners();
        print(msg);
      }
    } catch (e) {
      msg = e.toString();
      notifyListeners();
      print(msg);
    }
  }
}
