import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: ListView(
          children: [
            // Notification 1
            NotificationCard(
              title: 'New University Scholarship Available!',
              description:
                  'A new scholarship opportunity has opened for students in your field. Apply now!',
              timestamp: 'Feb 26, 2025',
            ),
            SizedBox(height: 16),
            // Notification 2
            NotificationCard(
              title: 'University Application Deadline Approaching!',
              description: 'Don’t miss the upcoming university application deadline.',
              timestamp: 'Feb 25, 2025',
            ),
            SizedBox(height: 16),
            // Notification 3
            NotificationCard(
              title: 'Important: Profile Update Required',
              description:
                  'Please update your profile details to ensure smooth communication with universities.',
              timestamp: 'Feb 24, 2025',
            ),
            SizedBox(height: 16),
            // Notification 4
            NotificationCard(
              title: 'New Event: Online Career Fair!',
              description: 'Join our virtual career fair event to connect with top employers.',
              timestamp: 'Feb 23, 2025',
            ),
            SizedBox(height: 16),
            // Notification 5
            NotificationCard(
              title: 'New Courses Available at Top Universities!',
              description: 'Check out the latest courses available for students in your field.',
              timestamp: 'Feb 22, 2025',
            ),
            SizedBox(height: 16),
            // Notification 6
            NotificationCard(
              title: 'University Rankings Update',
              description: 'The latest rankings of universities have been updated. Check them out!',
              timestamp: 'Feb 21, 2025',
            ),
            SizedBox(height: 16),
            // Notification 7
            NotificationCard(
              title: 'Important: FAFSA Submission Deadline',
              description:
                  'Reminder: The FAFSA submission deadline is fast approaching. Apply now!',
              timestamp: 'Feb 20, 2025',
            ),
            SizedBox(height: 16),
            // Notification 8
            NotificationCard(
              title: 'Reminder: Attend the Campus Tour Webinar!',
              description: 'Get an inside look at campus life through our live webinar.',
              timestamp: 'Feb 19, 2025',
            ),
            SizedBox(height: 16),
            // Notification 9
            NotificationCard(
              title: 'New Internship Opportunities Available!',
              description:
                  'Explore new internship opportunities that are now available in your field.',
              timestamp: 'Feb 18, 2025',
            ),
            SizedBox(height: 16),
            // Notification 10
            NotificationCard(
              title: 'Scholarship Application Tips and Guidelines',
              description: 'Read our expert tips on how to increase your chances of winning scholarships.',
              timestamp: 'Feb 17, 2025',
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String timestamp;

  NotificationCard({
    required this.title,
    required this.description,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent.withOpacity(0.8), Colors.blue.shade200],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              timestamp,
              style: TextStyle(
                color: Colors.white54,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
