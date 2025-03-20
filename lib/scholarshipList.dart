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
    },
    {
      'title': 'The AAUW American Fellowships',
      'level': 'Master’s, PhD, Postdoctoral',
      'eligibility': 'Women who are U.S. citizens or permanent residents.',
      'details': 'Supports U.S. women pursuing full-time graduate or postdoctoral study in the United States.'
    },
    {
      'title': 'The U.S. Department of Homeland Security (DHS) Scholarship Program',
      'level': 'Undergraduate, Master’s',
      'eligibility': 'U.S. citizens or permanent residents studying in cybersecurity and related fields.',
      'details': 'Offers scholarships for students pursuing degrees in cybersecurity and related disciplines to work in U.S. government agencies.'
    },
    {
      'title': 'The Truman Scholarship',
      'level': 'Undergraduate (Junior year)',
      'eligibility': 'U.S. citizens with a record of leadership, public service, and commitment to working in public service.',
      'details': 'Provides up to 30,000 for graduate school to students with a commitment to a career in public service.'
    },
    {
      'title': 'The National Science Foundation (NSF) Graduate Research Fellowship Program',
      'level': 'Master’s, PhD',
      'eligibility': 'U.S. citizens, nationals, or permanent residents.',
      'details': 'Provides financial support to graduate students in STEM disciplines for their research and studies in the U.S.'
    },
    {
      'title': 'The Barry Goldwater Scholarship and Excellence in Education Program',
      'level': 'Undergraduate (Sophomore or Junior)',
      'eligibility': 'U.S. citizens or permanent residents pursuing degrees in STEM fields.',
      'details': 'Awards scholarships to students who are committed to a career in STEM research.'
    },
    {
      'title': 'The Coca-Cola Scholars Program',
      'level': 'Undergraduate (Senior year of high school)',
      'eligibility': 'U.S. high school seniors.',
      'details': 'Awards scholarships to exceptional high school seniors who demonstrate leadership, service, and commitment to making a significant impact.'
    },
    {
      'title': 'The United Negro College Fund (UNCF) Scholarships',
      'level': 'Undergraduate, Graduate',
      'eligibility': 'U.S. students of African descent.',
      'details': 'Offers financial support to students attending historically black colleges and universities (HBCUs).'
    },
    {
      'title': 'The National Merit Scholarship Program',
      'level': 'Undergraduate (High School Seniors)',
      'eligibility': 'High school seniors in the United States who have shown outstanding academic achievement.',
      'details': 'Merit-based scholarships for U.S. students based on standardized test scores and academic performance.'
    },
    {
      'title': 'The McDonald\'s HACER National Scholarship',
      'level': 'Undergraduate',
      'eligibility': 'U.S. students of Hispanic heritage.',
      'details': 'Provides scholarships to Hispanic students who demonstrate financial need and academic success.'
    },
    {
      'title': 'The Dell Scholars Program',
      'level': 'Undergraduate',
      'eligibility': 'U.S. students who demonstrate a need for financial assistance and show perseverance.',
      'details': 'Offers scholarships and resources for students from underrepresented communities pursuing a post-secondary education.'
    },
    {
      'title': 'The Jack Kent Cooke Foundation Scholarship',
      'level': 'Undergraduate, Graduate',
      'eligibility': 'U.S. citizens who demonstrate exceptional academic achievement and financial need.',
      'details': 'Offers funding for college and graduate school for high-achieving students from low-income backgrounds.'
    },
    {
      'title': 'The Reagan Foundation Scholarship Program',
      'level': 'Undergraduate',
      'eligibility': 'U.S. high school seniors with leadership skills, academic excellence, and a commitment to public service.',
      'details': 'Provides scholarships to students who demonstrate leadership and community involvement.'
    },
    {
      'title': 'The National Association of Black Journalists (NABJ) Scholarships',
      'level': 'Undergraduate, Graduate',
      'eligibility': 'African American students pursuing degrees in journalism and media-related fields.',
      'details': 'Offers scholarships for students pursuing careers in journalism.'
    },
    {
      'title': 'The National Academy of Engineering (NAE) Grand Challenge Scholars Program',
      'level': 'Undergraduate, Graduate',
      'eligibility': 'U.S. citizens pursuing engineering degrees.',
      'details': 'Supports students pursuing innovative solutions to global engineering challenges.'
    },
    {
      'title': 'The American Indian College Fund Scholarships',
      'level': 'Undergraduate, Graduate',
      'eligibility': 'U.S. Native American students.',
      'details': 'Provides scholarships for Native American students pursuing higher education in the U.S.'
    },
    {
      'title': 'The American Society of Engineers (ASEE) Scholarships',
      'level': 'Undergraduate, Graduate',
      'eligibility': 'U.S. students pursuing engineering degrees.',
      'details': 'Offers scholarships for engineering students with a focus on diversity and innovation in the field.'
    },
    {
      'title': 'The Horatio Alger Scholarship Program',
      'level': 'Undergraduate (High School Seniors)',
      'eligibility': 'U.S. students who demonstrate financial need and have overcome adversity.',
      'details': 'Provides scholarships to students who have demonstrated integrity, perseverance, and hard work in overcoming personal obstacles.'
    },
    {
      'title': 'The Bill and Melinda Gates Foundation Scholarship Program',
      'level': 'Undergraduate, Graduate',
      'eligibility': 'U.S. students with financial need.',
      'details': 'Supports students pursuing higher education in the U.S. with a focus on overcoming social and economic challenges.'
    },
    {
      'title': 'The Nike Eileen Fisher Scholarship Program',
      'level': 'Undergraduate',
      'eligibility': 'Female U.S. high school seniors pursuing a degree in business, technology, or the arts.',
      'details': 'Provides funding for college education to young women committed to making a difference in the world.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('USA Scholarships List'),
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
              subtitle: Text(
                'Level: ${scholarships[index]['level']} \nEligibility: ${scholarships[index]['eligibility']} \nDetails: ${scholarships[index]['details']}',
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
