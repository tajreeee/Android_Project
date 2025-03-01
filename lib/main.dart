import 'package:flutter/material.dart';
import 'opening_screen.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'USA Study Guidance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OpeningScreen(), 
    );
  }
}
