import 'package:flutter/material.dart';
import 'viewMyProfile.dart'; 
import 'notification.dart'; 
import 'mentorList.dart'; 
import 'supportPage.dart'; 
import 'calendarPage.dart'; 
import 'scholarshipList.dart'; 
import 'universityList.dart'; 
import 'visaAssistance.dart';  
import 'community_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDarkMode = false;

  final List<_OptionItem> options = [
    _OptionItem('View Universities', Icons.school, UniversityListPage()),
    _OptionItem('View Scholarships', Icons.card_giftcard, ScholarshipList()),
    _OptionItem('View My Profile', Icons.person, ViewMyProfilePage(userEmail: '')),
    _OptionItem('View Notifications', Icons.notifications, NotificationPage()),
    _OptionItem('Chat with Mentors', Icons.chat, MentorListPage()),
    _OptionItem('Support', Icons.support_agent, SupportPage()),
    _OptionItem('Deadlines in Calendar', Icons.calendar_today, CalendarPage()),
    _OptionItem('Community', Icons.group, CommunityPage()),
    _OptionItem('Visa Assistance', Icons.airplane_ticket, VisaAssistancePage()),
  ];

  @override
  Widget build(BuildContext context) {
    final bgColor = isDarkMode ? Colors.black : Colors.white;
    final textColor = isDarkMode ? Colors.white : Color.fromARGB(255, 5, 35, 59);
    final cardColor = isDarkMode ? Colors.grey[900] : Colors.white.withOpacity(0.9);
    final shadowColor = isDarkMode ? Colors.black54 : Colors.black26;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
        elevation: 4,
        title: Text(
          'Home',
          style: TextStyle(color: textColor),
        ),
        actions: [
          Switch(
            value: isDarkMode,
            onChanged: (val) {
              setState(() {
                isDarkMode = val;
              });
            },
            activeColor: Colors.blueAccent,
            inactiveThumbColor: Colors.grey,
          ),
        ],
        iconTheme: IconThemeData(color: textColor),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/home.jpg',
              fit: BoxFit.cover,
              color: isDarkMode
                  ? Colors.black.withOpacity(0.6)
                  : Colors.black.withOpacity(0.3),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  'Welcome to the Home Page!',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      itemCount: options.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // 4 smaller cards per row
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 15,
                        childAspectRatio: 0.85, // Slightly taller than wide
                      ),
                      itemBuilder: (context, i) {
                        return _OptionCard(
                          label: options[i].label,
                          icon: options[i].icon,
                          cardColor: cardColor!,
                          shadowColor: shadowColor!,
                          textColor: textColor,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => options[i].page),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OptionItem {
  final String label;
  final IconData icon;
  final Widget page;

  _OptionItem(this.label, this.icon, this.page);
}

class _OptionCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color cardColor;
  final Color shadowColor;
  final Color textColor;
  final VoidCallback onTap;

  const _OptionCard({
    Key? key,
    required this.label,
    required this.icon,
    required this.cardColor,
    required this.shadowColor,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: cardColor,
      elevation: 6,
      borderRadius: BorderRadius.circular(20),
      shadowColor: shadowColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: textColor),
              SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}