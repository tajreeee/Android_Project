import 'package:flutter/material.dart';
import 'login.dart'; // Import the login screen

class OpeningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/Open.png', // Ensure the image is in the assets folder
            fit: BoxFit.cover,
          ),
          
          // "Get Started" Button in the lower-right corner
          Positioned(
            bottom: 50, // Adjust vertical position
            right: 30,  // Adjust horizontal position
            child: ElevatedButton(
              onPressed: () {
                // Navigate to Login Page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 16, 6, 62), // White button
                foregroundColor: const Color.fromARGB(255, 216, 216, 216), // Text color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5, // Soft shadow effect
              ),
              child: Text(
                "Get Started",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
