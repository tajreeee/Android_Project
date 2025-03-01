import 'package:flutter/material.dart';

class ScholarshipList extends StatelessWidget {
  final List<Map<String, String>> scholarships = [
    {
      'title': 'Fulbright Foreign Student Program',
      'level': 'Master\'s, PhD',
      'eligibility': 'International students from around the world.',
      'details': 'Offers scholarships for graduate study in the United States to increase mutual understanding between the people of the U.S. and other nations.'
    },
    {
      'title': 'The Hubert H. Humphrey Fellowship Program',
      'level': 'Master\'s (non-degree program)',
      'eligibility': 'Mid-career professionals from developing countries.',
      'details': 'Offers opportunities for professional development and fosters exchange between future leaders and policymakers.'
    },
    {
      'title': 'The American University Emerging Global Leader Scholarship',
      'level': 'Undergraduate (BSc)',
      'eligibility': 'International students from developing countries with a demonstrated commitment to leadership and community development.',
      'details': 'Full tuition, room, and board to study at American University in Washington, D.C.'
    },
    {
      'title': 'Stanford University Knight-Hennessy Scholars Program',
      'level': 'Master\'s, PhD',
      'eligibility': 'Outstanding graduate students from any country.',
      'details': 'Provides funding for graduate study at Stanford, as well as leadership development opportunities.'
    },
    {
      'title': 'The United Nations International School (UNIS) Scholarships',
      'level': 'Undergraduate (BSc), Master\'s',
      'eligibility': 'International students.',
      'details': 'Full and partial scholarships for international students to attend university-level studies.'
    },
    {
      'title': 'The AAUW International Fellowships',
      'level': 'Master\'s, PhD',
      'eligibility': 'Women who are not U.S. citizens or permanent residents.',
      'details': 'Supports graduate women students from all countries for study in the USA.'
    },
    {
      'title': 'The International Student Scholarship at the University of Miami',
      'level': 'Undergraduate (BSc), Master\'s',
      'eligibility': 'International students.',
      'details': 'Partial to full tuition scholarships for international students studying at the University of Miami.'
    },
    {
      'title': 'Yale University Fellowship for International Students',
      'level': 'Master\'s, PhD',
      'eligibility': 'International students admitted to Yale\'s graduate programs.',
      'details': 'Provides financial assistance based on need for international students.'
    },
    {
      'title': 'The Onsi Sawiris Scholarship Program',
      'level': 'Master’s (for students from Egypt)',
      'eligibility': 'Egyptian students pursuing a Master’s degree in the U.S.',
      'details': 'Full tuition, living expenses, and airfare for Egyptian students.'
    },
    {
      'title': 'The Joint Japan/World Bank Graduate Scholarship Program',
      'level': 'Master’s',
      'eligibility': 'Students from developing countries.',
      'details': 'Provides funding for students from World Bank member countries to pursue a master’s degree in the U.S.'
    },
    {
      'title': 'The P.E.O. International Peace Scholarship Fund',
      'level': 'Master’s',
      'eligibility': 'Women international students.',
      'details': 'Provides financial assistance to international women students who wish to pursue graduate study in the United States.'
    },
    {
      'title': 'The Gates Cambridge Scholarship',
      'level': 'Master’s, PhD',
      'eligibility': 'Non-U.S. students applying for a degree at Cambridge University.',
      'details': 'Fully funded scholarships covering tuition fees, living costs, and airfare.'
    },
    {
      'title': 'The MEXT (Monbukagakusho) Scholarship',
      'level': 'Undergraduate, Master’s, PhD',
      'eligibility': 'International students from various countries.',
      'details': 'A Japanese government scholarship for students wishing to study in the United States.'
    },
    {
      'title': 'The Global Scholarship Programme at the University of California, Berkeley',
      'level': 'Master’s, PhD',
      'eligibility': 'International students with strong academic and leadership records.',
      'details': 'Full tuition and additional benefits for eligible international students.'
    },
    {
      'title': 'The Knight-Hennessy Scholars Program at Stanford University',
      'level': 'Master’s, PhD',
      'eligibility': 'International students worldwide.',
      'details': 'Covers full tuition, living stipend, and additional support.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scholarships List'),
        backgroundColor: Color(0xFF2196F3),
      ),
      body: ListView.builder(
        itemCount: scholarships.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: ListTile(
              title: Text(
                scholarships[index]['title']!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Level: ${scholarships[index]['level']}'),
                  Text('Eligibility: ${scholarships[index]['eligibility']}'),
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScholarshipInfo(
                      scholarship: scholarships[index],
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

class ScholarshipInfo extends StatelessWidget {
  final Map<String, String> scholarship;

  ScholarshipInfo({required this.scholarship});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(scholarship['title']!),
        backgroundColor: Color(0xFF2196F3),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Level: ${scholarship['level']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Eligibility: ${scholarship['eligibility']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Details: ${scholarship['details']}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
