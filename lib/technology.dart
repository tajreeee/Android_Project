import 'package:flutter/material.dart';

class UniversityListPage extends StatelessWidget {

  final List<Map<String, String>> universities = [
    {"rank": "1", "name": "Harvard University"},
    {"rank": "2", "name": "Stanford University"},
    {"rank": "3", "name": "Massachusetts Institute of Technology (MIT)"},
    {"rank": "4", "name": "California Institute of Technology (Caltech)"},
    {"rank": "5", "name": "University of Chicago"},
    {"rank": "6", "name": "Princeton University"},
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top 100 Universities of USA", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFF2196F3),
        elevation: 4,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12.0),
        itemCount: universities.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
              title: Row(
                children: [
                  Text(
                    "${universities[index]["rank"]}. ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      universities[index]["name"]!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                
              },
            ),
          );
        },
      ),
    );
  }
}
