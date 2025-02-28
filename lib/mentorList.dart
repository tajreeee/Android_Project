import 'package:flutter/material.dart';
import 'chatWithMentor.dart'; // Import the chat page

class MentorListPage extends StatelessWidget {
  // Sample mentor names
  final List<String> mentorNames = [
    'John Doe', 'Jane Smith', 'Michael Johnson', 'Emily Davis', 'Chris Evans',
    'Amanda Lee', 'David Miller', 'Sophia Brown', 'James Wilson', 'Olivia Harris'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mentor List'),
        backgroundColor: Color(0xFF2196F3),
      ),
      body: ListView.builder(
        itemCount: mentorNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFF2196F3),
              child: Text(
                mentorNames[index][0], // Display the first letter of the mentor's name
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(mentorNames[index], style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Tap to chat'),
            onTap: () {
              // Navigate to the chat page with the selected mentor
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatWithMentorPage(mentorName: mentorNames[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
