import 'package:flutter/material.dart';

class UniversityListPage extends StatelessWidget {
  
  final List<String> universities = [
    "Harvard University",
    "Stanford University",
    "Massachusetts Institute of Technology (MIT)",
    "California Institute of Technology (Caltech)",
    "University of Chicago",
    "Princeton University",
    "Columbia University",
    "Yale University",
    "University of Pennsylvania",
    "California University Berkeley",
    "University of California Los Angeles (UCLA)",
    "University of Michigan Ann Arbor",
    "Cornell University",
    "University of Washington",
    "Duke University",
    "Northwestern University",
    "University of California San Diego (UCSD)",
    "University of Southern California (USC)",
    "Johns Hopkins University",
    "New York University (NYU)",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top 20 Universities of USA"),
        backgroundColor: Color(0xFF2196F3),
      ),
      body: ListView.builder(
        itemCount: universities.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text(
                universities[index],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UniversityDetailPage(
                      universityName: universities[index],
                    ),
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

class UniversityDetailPage extends StatelessWidget {
  final String universityName;

  UniversityDetailPage({required this.universityName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(universityName),
        backgroundColor: Color(0xFF2196F3),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              universityName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Detailed information about $universityName.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
