import 'package:flutter/material.dart';
import 'chatWithMentor.dart'; 

class MentorListPage extends StatelessWidget {
  final List<String> mentorNames = [
    'John Doe', 'Jane Smith', 'Michael Johnson', 'Emily Davis', 'Chris Evans',
    'Amanda Lee', 'David Miller', 'Sophia Brown', 'James Wilson', 'Olivia Harris'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mentor List', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFF2196F3),
        elevation: 4,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: mentorNames.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              leading: CircleAvatar(
                backgroundColor: Color(0xFF2196F3),
                radius: 30,
                child: Text(
                  mentorNames[index][0], 
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                mentorNames[index], 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              subtitle: Text(
                'Tap to chat', 
                style: TextStyle(color: Colors.black54),
              ),
              trailing: Icon(
                Icons.chat_bubble_outline,
                color: Color(0xFF2196F3),
                size: 24,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatWithMentorPage(mentorName: mentorNames[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
