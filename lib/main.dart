import 'package:bmi_calculater/layout/home_layout.dart';
import 'package:bmi_calculater/layout/news_layout.dart';
import 'package:bmi_calculater/modules/bmi/bmi_screen.dart';
import 'package:bmi_calculater/modules/counter_screen.dart';
import 'package:bmi_calculater/modules/login/login_screen.dart';
import 'package:bmi_calculater/modules/messanger/messenger_screen.dart';
import 'package:bmi_calculater/modules/users/user_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiScreen(),
    );
  }
}
