import 'package:flutter/material.dart';
import 'viewMyProfile.dart'; 
import 'notification.dart'; 
import 'mentorList.dart'; 
import 'supportPage.dart'; 
import 'calendarPage.dart'; 
import 'scholarshipList.dart'; 
import 'universityList.dart'; 
import 'visaAssistance.dart';  

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Positioned.fill(
            child: Image.asset(
              'assets/home.jpg',  
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Welcome Text
                  Text(
                    'Welcome to the Home Page!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(height: 50),

                  // Universities Button
                  _buildButton(context, 'View Universities', UniversityListPage()),

                  // Scholarships Button
                  _buildButton(context, 'View Scholarships', ScholarshipList()),

                  // My Profile Button
                  _buildButton(context, 'View My Profile', ViewMyProfilePage(userEmail: '',)),

                  // Notifications Button
                  _buildButton(context, 'View Notifications', NotificationPage()),

                  // Mentors Button
                  _buildButton(context, 'Chat with Mentors', MentorListPage()),

                  // Support Button
                  _buildButton(context, 'Support', SupportPage()),

                  // Calendar Button
                  _buildButton(context, 'Deadlines in Calendar', CalendarPage()),

                  // Visa Assistance Button (New Button)
                  _buildButton(context, 'Visa Assistance', VisaAssistancePage()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // A helper method to create buttons with consistent sizes and spacing
  Widget _buildButton(BuildContext context, String label, Widget page) {
    return Column(
      children: [
        SizedBox(height: 15),  // Add space between buttons
        SizedBox(
          width: double.infinity,  // Make buttons stretch to fill the width
          height: 60,  // Fixed height for all buttons
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Color.fromARGB(255, 5, 36, 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: Color.fromARGB(255, 5, 35, 59),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
