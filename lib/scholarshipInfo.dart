import 'package:flutter/material.dart';

class ScholarshipInfoPage extends StatelessWidget {
  final Map<String, dynamic> scholarship;

  ScholarshipInfoPage({required this.scholarship});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(scholarship['name']),
        backgroundColor: Color(0xFF2196F3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Scholarship: ${scholarship['name']}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Country: ${scholarship['country']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Eligibility Criteria:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: scholarship['criteria']
                  .map<Widget>((criterion) => Text(
                        '- $criterion',
                        style: TextStyle(fontSize: 16),
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Course Duration: ${scholarship['courseDuration']}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
