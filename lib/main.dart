import 'package:flutter/material.dart';
import 'opening_screen.dart'; // Import the opening screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner
      title: 'USA Sudy Guidance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OpeningScreen(), // Start with OpeningScreen
    );
  }
}
