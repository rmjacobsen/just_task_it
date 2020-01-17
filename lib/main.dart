import 'package:flutter/material.dart';

import './core/wrapper.dart';



void main() async {
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
      home: Wrapper(),
      debugShowCheckedModeBanner: false,
    );
  }
}
