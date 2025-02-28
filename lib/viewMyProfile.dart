import 'package:flutter/material.dart';

class ViewMyProfilePage extends StatefulWidget {
  @override
  _ViewMyProfilePageState createState() => _ViewMyProfilePageState();
}

class _ViewMyProfilePageState extends State<ViewMyProfilePage> {
  bool showSkills = false;
  bool showAchievements = false;
  bool showContactInfo = false;
  bool showInterests = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Plain white background for elegance
      appBar: AppBar(
        backgroundColor: Color(0xFF1976D2),
        title: Text(
          'My Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'Roboto',
            letterSpacing: 2,
          ),
        ),
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              // Profile Card with essential information
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.blue[50], // Soft blue for the profile card
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Name Display
                    Text(
                      'Jannatul Ferdous Tajree',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(height: 5),
                    // Degree and Year
                    Text(
                      'BSc. Engineering, 2nd Year, Software Engineering',
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(height: 10),
                    // University Display
                    Text(
                      'University: Shahjalal University of Science and Technology',
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(height: 10),
                    // Phone Number
                    Text(
                      'Phone: +1 234 567 890',
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Skill Section - Envelope Button
              ProfileEnvelopeButton(
                title: 'Skills',
                onPressed: () {
                  setState(() {
                    showSkills = !showSkills;
                  });
                },
                showContent: showSkills,
                content: 'Flutter, Dart, Python, Java, C++, SQL, Git, Android Development',
              ),
              SizedBox(height: 20),

              // Achievements Section - Envelope Button
              ProfileEnvelopeButton(
                title: 'Achievements',
                onPressed: () {
                  setState(() {
                    showAchievements = !showAchievements;
                  });
                },
                showContent: showAchievements,
                content: '1. Champion at XYZ Hackathon',
              ),
              SizedBox(height: 20),

              // Contact Info Section - Envelope Button
              ProfileEnvelopeButton(
                title: 'Contact Info',
                onPressed: () {
                  setState(() {
                    showContactInfo = !showContactInfo;
                  });
                },
                showContent: showContactInfo,
                content: 'Email: jannatul@gmail.com\nLinkedIn: linkedin.com/in/jannatul',
              ),
              SizedBox(height: 20),

              // Interests Section - Envelope Button
              ProfileEnvelopeButton(
                title: 'Interests',
                onPressed: () {
                  setState(() {
                    showInterests = !showInterests;
                  });
                },
                showContent: showInterests,
                content: 'Traveling, Coding, Playing Chess, Reading Tech Blogs',
              ),
              SizedBox(height: 30),

              // Social Media Links
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.facebook, color: Colors.blue, size: 35),
                    onPressed: () {
                      // Add functionality for Facebook link
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.camera_alt, color: Colors.pink, size: 35), // Instagram Icon
                    onPressed: () {
                      // Add functionality for Instagram link
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Bottom Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Edit Profile Button
                  ElevatedButton(
                    onPressed: () {
                      // Implement Edit Profile functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Edit Profile clicked')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF1976D2),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      shadowColor: Colors.blueAccent,
                      elevation: 5,
                    ),
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: Color(0xFF1976D2),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  // Log Out Button
                  ElevatedButton(
                    onPressed: () {
                      // Implement Logout functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Logging Out...')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF1976D2),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      shadowColor: Colors.blueAccent,
                      elevation: 5,
                    ),
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        color: Color(0xFF1976D2),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// Envelope-style collapsible button widget
class ProfileEnvelopeButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool showContent;
  final String content;

  ProfileEnvelopeButton({
    required this.title,
    required this.onPressed,
    required this.showContent,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.mail_outline,
              color: Colors.blueAccent, // Envelope icon
              size: 30,
            ),
            title: Text(
              title,
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            trailing: Icon(
              showContent ? Icons.expand_less : Icons.expand_more,
              color: Colors.blueAccent,
            ),
            onTap: onPressed,
          ),
          if (showContent)
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                content,
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
        ],
      ),
    );
  }
}
