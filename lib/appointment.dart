import 'package:flutter/material.dart';

class AppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Your Visa Appointment'),
        backgroundColor: Color.fromARGB(255, 134, 148, 159),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            _buildStep('Step 1: Create a Profile', 
              'Visit the U.S. Department of State website to create a profile and sign in to the Consular Electronic Application Center (CEAC).'),
            SizedBox(height: 20),
            
            _buildStep('Step 2: Complete the DS-160 Form', 
              'Make sure to fill out the DS-160 form carefully. You will need to upload a passport-size photograph and fill in your details.'),
            SizedBox(height: 20),
            
            _buildStep('Step 3: Pay the Visa Fee', 
              'Make the required payment for your visa application. Keep a copy of the receipt after payment.'),
            SizedBox(height: 20),
            
            _buildStep('Step 4: Schedule Your Interview', 
              'Select the nearest U.S. embassy or consulate and schedule your visa interview. You will need to select the date and time for your interview.'),
            SizedBox(height: 20),
            
            _buildStep('Step 5: Confirmation and Interview Preparation', 
              'After scheduling the interview, you will receive a confirmation. Make sure to prepare all necessary documents and arrive early for your interview.'),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(String title, String description) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 5, 36, 60),
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
