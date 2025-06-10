import 'package:flutter/material.dart';
import 'chatWithMentor.dart';

class MentorListPage extends StatefulWidget {
  @override
  _MentorListPageState createState() => _MentorListPageState();
}

class _MentorListPageState extends State<MentorListPage> {
  bool isDarkMode = false;

  final List<Map<String, String>> mentors = [
    {'name': 'John Doe', 'image': 'assets/ppb1.jpg', 'status': 'online'},
    {'name': 'Jane Smith', 'image': 'assets/ppb2.jpg', 'status': 'offline'},
    {'name': 'Michael Johnson', 'image': 'assets/ppb3.jpg', 'status': 'online'},
    {'name': 'Emily Davis', 'image': 'assets/ppg1.jpg', 'status': 'offline'},
    {'name': 'Chris Evans', 'image': 'assets/ppb4.jpg', 'status': 'online'},
    {'name': 'Amanda Lee', 'image': 'assets/ppg2.jpg', 'status': 'offline'},
    {'name': 'David Miller', 'image': 'assets/ppb5.jpg', 'status': 'online'},
    {'name': 'Sophia Brown', 'image': 'assets/ppg3.jpg', 'status': 'offline'},
    {'name': 'James Wilson', 'image': 'assets/ppb6.jpg', 'status': 'online'},
    {'name': 'Olivia Harris', 'image': 'assets/ppg4.jpg', 'status': 'offline'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = isDarkMode ? ThemeData.dark() : ThemeData.light();

    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mentor List'),
          backgroundColor: isDarkMode ? Colors.grey[900] : Color(0xFF2196F3),
          actions: [
            Row(
              children: [
                Icon(
                  isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  color: Colors.white,
                ),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      isDarkMode = value;
                    });
                  },
                  activeColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: mentors.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                leading: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        mentors[index]['image']!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (mentors[index]['status'] == 'online')
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isDarkMode ? Colors.black : Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                title: Text(
                  mentors[index]['name']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                subtitle: Text(
                  'Tap to chat',
                  style: TextStyle(
                    color: isDarkMode ? Colors.grey[300] : Colors.black54,
                  ),
                ),
                trailing: Icon(
                  Icons.chat_bubble_outline,
                  color: Color(0xFF2196F3),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatWithMentorPage(
                        mentorName: mentors[index]['name']!,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
