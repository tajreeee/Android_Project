import 'package:flutter/material.dart';

import 'appointment.dart';
import 'document.dart';
import 'overview.dart';

class VisaAssistancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _buildBackground(),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  VisaActionButton(
                    text: 'Overview of F1 Visa Process',
                    color: Colors.blueAccent,
                    onPressed: () => _navigateToPage(context, OverviewPage()),
                  ),
                  VisaActionButton(
                    text: 'Documents Required',
                    color: Colors.greenAccent,
                    onPressed: () => _navigateToPage(context, DocumentPage()),
                  ),
                  VisaActionButton(
                    text: 'Book Visa Appointment',
                    color: Colors.orangeAccent,
                    onPressed: () => _navigateToPage(context, AppointmentPage()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget _buildBackground() {
    return Positioned.fill(
      child: Image.asset(
        'assets/visa.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  void _navigateToPage(BuildContext context, Widget page) {

    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}


class VisaActionButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const VisaActionButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
