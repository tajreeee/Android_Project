import 'package:flutter/material.dart';

class ViewMyProfilePage extends StatefulWidget {
  final String userEmail;  // Email passed from login screen

  ViewMyProfilePage({required this.userEmail});

  @override
  _ViewMyProfilePageState createState() => _ViewMyProfilePageState();
}

class _ViewMyProfilePageState extends State<ViewMyProfilePage> {
  bool isEditing = false; // Flag to switch between view and edit mode

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController achievementsController = TextEditingController();
  TextEditingController interestsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current data
    nameController.text = 'Jannatul Ferdous Tajree'; // Example default name
    phoneController.text = '+1 234 567 890'; // Example default phone
    skillsController.text = 'Flutter, Dart, Python, Java, C++, SQL';
    achievementsController.text = 'Champion at XYZ Hackathon';
    interestsController.text = 'Traveling, Coding, Playing Chess, Reading Tech Blogs';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              // Profile Information Card
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      
                      SizedBox(height: 20),
                      TextFormField(
                        controller: nameController,
                        enabled: isEditing,
                        style: TextStyle(
                          color: isEditing ? Colors.black : Colors.black,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          prefixIcon: Icon(Icons.person),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: phoneController,
                        enabled: isEditing,
                        style: TextStyle(
                          color: isEditing ? Colors.black : Colors.black,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          prefixIcon: Icon(Icons.phone),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: skillsController,
                        enabled: isEditing,
                        style: TextStyle(
                          color: isEditing ? Colors.black : Colors.black,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Skills',
                          prefixIcon: Icon(Icons.code),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: achievementsController,
                        enabled: isEditing,
                        style: TextStyle(
                          color: isEditing ? Colors.black : Colors.black,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Achievements',
                          //prefixIcon: Icon(Icons.trophy),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: interestsController,
                        enabled: isEditing,
                        style: TextStyle(
                          color: isEditing ? Colors.black : Colors.black,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Interests',
                          prefixIcon: Icon(Icons.interests),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Edit/Save Button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isEditing = !isEditing;
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  isEditing ? 'Save Profile' : 'Edit Profile',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              // Log Out Button
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Logging Out...')),
                  );
                  // Navigate to login screen after logout
                  Navigator.pushReplacementNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Log Out',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
