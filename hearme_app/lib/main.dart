import 'package:flutter/material.dart';
import 'package:hearme_app/constants.dart';
import 'package:hearme_app/pages/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hearme App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Inter",
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: kBlackColor)
        ),
        useMaterial3: true,
      ),
      home: Homepage(),
    );
  }
}