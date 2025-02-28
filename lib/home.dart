import 'package:flutter/material.dart';
import 'viewMyProfile.dart'; // Import the ProfilePage
import 'notification.dart'; // Import the Notification Page
import 'mentorList.dart'; // Import the Mentor List Page
import 'supportPage.dart'; // Import the Support Page
import 'calendarPage.dart'; // Import the Calendar Page
import 'scholarshipList.dart'; // Import the Scholarship List Page
import 'universityList.dart'; // Import the University List Page

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/home.png', // Path to your background image
              fit: BoxFit.cover,
            ),
          ),
          // Main Content
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title Text
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

                  // View Universities Button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the University List page when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UniversityListPage()), // Navigate to UniversityListPage
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color.fromARGB(255, 5, 36, 60),
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'View Universities',
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 35, 59),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // View Scholarships Button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the Scholarship List page when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ScholarshipList()), // Navigate to ScholarshipListPage
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color.fromARGB(255, 5, 35, 59),
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'View Scholarships',
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 35, 59),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // View My Profile Button (Navigates to ProfilePage)
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the profile page when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewMyProfilePage()), // Navigate to ViewMyProfilePage
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color.fromARGB(255, 5, 36, 61),
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'View My Profile',
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 33, 55),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Notification Button (Navigates to Notification Page)
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the Notification page when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotificationPage()), // Navigate to NotificationPage
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color.fromARGB(255, 5, 34, 58),
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'View Notifications',
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 39, 68),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Chat with Mentors Button (Navigates to Mentor List Page)
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the Mentor List page when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MentorListPage()), // Navigate to Mentor List Page
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color.fromARGB(255, 4, 41, 71),
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Chat with Mentors',
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 31, 53),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Support Button (Navigates to Support Page)
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the Support page when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SupportPage()), // Navigate to SupportPage
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color.fromARGB(255, 5, 33, 55),
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Support',
                      style: TextStyle(
                        color: Color.fromARGB(255, 6, 34, 57),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Deadlines in Calendar Button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the Calendar page when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CalendarPage()), // Navigate to CalendarPage
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color.fromARGB(255, 6, 35, 59),
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Deadlines in Calendar',
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 34, 58),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
