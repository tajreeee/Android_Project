import 'package:flutter/material.dart';



class AppointmentPage extends StatelessWidget {
  final List<Map<String, String>> appointmentSteps = [
    {
      'title': 'Step 1: Create a Profile',
      'description':
          'Visit the U.S. Department of State website to create a profile and sign in to the Consular Electronic Application Center (CEAC).',
    },
    {
      'title': 'Step 2: Complete the DS-160 Form',
      'description':
          'Make sure to fill out the DS-160 form carefully. You will need to upload a passport-size photograph and fill in your details.',
    },
    {
      'title': 'Step 3: Pay the Visa Fee',
      'description':
          'Make the required payment for your visa application. Keep a copy of the receipt after payment.',
    },
    {
      'title': 'Step 4: Schedule Your Interview',
      'description':
          'Select the nearest U.S. embassy or consulate and schedule your visa interview. You will need to select the date and time for your interview.',
    },
    {
      'title': 'Step 5: Confirmation and Interview Preparation',
      'description':
          'After scheduling the interview, you will receive a confirmation. Make sure to prepare all necessary documents and arrive early for your interview.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Your Visa Appointment'),
        backgroundColor: Color.fromARGB(255, 134, 148, 159),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: appointmentSteps.length,
          itemBuilder: (context, index) {
            final step = appointmentSteps[index];
            return Column(
              children: [
                AppointmentStepCard(
                  title: step['title']!,
                  description: step['description']!,
                ),
                SizedBox(height: 20),
              ],
            );
          },

        ),
      ),
    );
  }
}


class AppointmentStepCard extends StatelessWidget {
  final String title;
  final String description;

  const AppointmentStepCard({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 5, 36, 60),
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
