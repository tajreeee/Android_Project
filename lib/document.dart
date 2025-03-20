import 'package:flutter/material.dart';

class DocumentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Required Documents for F1 Visa'),
        backgroundColor: Color.fromARGB(255, 125, 132, 138),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            _buildDocumentItem('1. Valid Passport', 'Ensure your passport is valid for at least six months beyond your intended stay in the U.S.'),
            _buildDocumentItem('2. Form DS-160', 'Complete the DS-160 form online and print the confirmation page.'),
            _buildDocumentItem('3. Visa Appointment Confirmation', 'After scheduling your interview, print the visa appointment confirmation.'),
            _buildDocumentItem('4. I-20 Form', 'This form is issued by the U.S. institution where you have been accepted. You must carry it to your interview.'),
            _buildDocumentItem('5. SEVIS Fee Payment Receipt', 'Keep a copy of the receipt after paying the SEVIS fee online.'),
            _buildDocumentItem('6. Visa Fee Receipt', 'Pay the visa fee and bring a copy of the receipt to the interview.'),
            _buildDocumentItem('7. Passport-Size Photographs', 'You will need to provide recent passport-size photographs that meet the U.S. visa requirements.'),
            _buildDocumentItem('8. Academic Transcripts and Certificates', 'Bring all your academic transcripts and certificates for verification.'),
            _buildDocumentItem('9. Financial Documents', 'Provide proof of sufficient funds to cover tuition fees and living expenses in the U.S.'),
            _buildDocumentItem('10. English Proficiency Test Scores', 'Submit your TOEFL or IELTS scores to prove your proficiency in English.'),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentItem(String title, String description) {
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
