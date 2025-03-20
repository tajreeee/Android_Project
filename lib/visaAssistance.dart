import 'package:flutter/material.dart';

import 'appointment.dart';
import 'document.dart';
import 'overview.dart';

class VisaAssistancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      extendBodyBehindAppBar: true, // Ensures the app bar is over the background image
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/visa.jpg', 
              fit: BoxFit.cover,
            ),
          ),
          // Centered content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildButton(
                    context,
                    'Overview of F1 Visa Process',
                    Colors.blueAccent,
                    () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => OverviewPage()));
                    },
                  ),
                  SizedBox(height: 20),
                  _buildButton(
                    context,
                    'Documents Required',
                    Colors.greenAccent,
                    () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => DocumentPage()));
                    },
                  ),
                  SizedBox(height: 20),
                  _buildButton(
                    context,
                    'Book Visa Appointment',
                    Colors.orangeAccent,
                    () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => AppointmentPage()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Button widget
  Widget _buildButton(
    BuildContext context,
    String text,
    Color color,
    Function onPressed,
  ) {
    return Container(
      width: double.infinity, // Makes it fill the width of the screen
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 10), // Adds spacing between buttons
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
