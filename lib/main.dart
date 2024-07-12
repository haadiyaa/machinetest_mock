import 'package:flutter/material.dart';
import 'package:login_app/provider/countryprovider.dart';
import 'package:login_app/view/welcomepage/view/welcomepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Countryprovider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: Typography.whiteCupertino,
          scaffoldBackgroundColor: Colors.grey.shade900,
        ),
        debugShowCheckedModeBanner: false,
        home: WelcomePage(),
      ),
    );
  }
}
