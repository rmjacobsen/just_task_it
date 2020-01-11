import 'package:flutter/material.dart';
import 'package:just_task_it/core/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Just Task It",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.amber,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
