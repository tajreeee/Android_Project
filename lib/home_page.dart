import 'package:flutter/material.dart';
import 'viewMyProfile.dart'; 
import 'notification.dart'; 
import 'mentorList.dart'; 
import 'supportPage.dart'; 
import 'calendarPage.dart'; 
import 'scholarshipList.dart'; 
import 'universityList.dart'; 

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Positioned.fill(
            child: Image.asset(
              'assets/home.png', 
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

                  
                  ElevatedButton(
                    onPressed: () {
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UniversityListPage()), 
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

                  
                  ElevatedButton(
                    onPressed: () {
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ScholarshipList()), 
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

                  
                  ElevatedButton(
                    onPressed: () {
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewMyProfilePage()), 
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

                  
                  ElevatedButton(
                    onPressed: () {
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NotificationPage()), 
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

                  
                  ElevatedButton(
                    onPressed: () {
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MentorListPage()), 
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

                  
                  ElevatedButton(
                    onPressed: () {
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SupportPage()), 
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

                  
                  ElevatedButton(
                    onPressed: () {
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CalendarPage()), 
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
