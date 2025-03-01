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
                mentorNames[index][0], 
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(mentorNames[index], style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Tap to chat'),
            onTap: () {
              
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
