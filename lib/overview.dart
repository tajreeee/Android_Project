import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Getting screen size using MediaQuery for responsive layout
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'F1 Visa Process Overview',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 208, 217, 224),
      ),
      body: SingleChildScrollView(  // Wrap the body in SingleChildScrollView for scrolling on small screens
        child: Padding(
          padding: EdgeInsets.all(15.0), // Padding for better layout on small screens
          child: Column(
            children: [
              _buildSectionCard(
                context,
                'Step 1: Apply to a US University',
                'assets/step1.jpg',  
                'Before applying for an F1 visa, you must first be accepted into a SEVP-approved U.S. school. '
                'Ensure your school is authorized to issue an I-20 form, which is essential for your visa application. '
                'The I-20 form proves that you have been accepted into a program and are eligible to apply for the F1 visa.',
              ),
              _buildSectionCard(
                context,
                'Step 2: Receive the I-20 Form',
                'assets/step2.jpg',
                'After being accepted, your school will send you an I-20 form. This is an important document '
                'that proves you have been accepted into a full-time study program at an accredited U.S. institution. '
                'The I-20 is required to apply for the F1 visa and must be presented during your visa interview.',
              ),
              _buildSectionCard(
                context,
                'Step 3: Pay the SEVIS Fee',
                'assets/step3.jpg',
                'You must pay the SEVIS fee, which is a system used to track students and exchange visitors. '
                'You can pay this fee online via the official website. The SEVIS fee payment is a requirement for visa application, '
                'and you will receive a receipt, which you must keep for your visa interview.',
              ),
              _buildSectionCard(
                context,
                'Step 4: Complete the DS-160 Form',
                'assets/step4.jpg',
                'The DS-160 form is an online application form required for all U.S. visa applicants. Fill out the form carefully, '
                'upload a passport-size photo, and keep the confirmation page after submission. The DS-160 form is essential to schedule your visa interview.',
              ),
              _buildSectionCard(
                context,
                'Step 5: Schedule Visa Interview',
                'assets/step5.jpg',
                'Once you have completed the DS-160, schedule an appointment for your visa interview at the nearest U.S. embassy or consulate. '
                'Make sure to have all your documents ready for the interview, including your passport, DS-160 confirmation, SEVIS receipt, and I-20 form.',
              ),
              _buildSectionCard(
                context,
                'Step 6: Attend the Visa Interview',
                'assets/step6.jpg',
                'During the interview, a consular officer will review your documents and ask questions about your study plans. '
                'You will need to provide proof of your academic qualifications, financial support, and ties to your home country. '
                'The officer will assess your eligibility for the F1 visa based on your documents and interview responses.',
              ),
              _buildSectionCard(
                context,
                'Step 7: Receive Your Visa',
                'assets/step7.jpg',
                'If your interview is successful, your visa will be approved. You will receive your passport with the F1 visa stamp, '
                'which will allow you to travel to the United States to begin your studies. This is the final step in the visa application process.',
              ),
              _buildSectionCard(
                context,
                'Step 8: Arrive in the US',
                'assets/step8.jpg',
                'Once you arrive in the U.S., you will need to show your I-20 form and other documents at the port of entry. '
                'The U.S. Customs and Border Protection (CBP) officer will stamp your I-20 and grant you entry as an F1 student. '
                'Ensure you have all your documents ready for inspection to avoid any issues at the border.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create a card for each step
  Widget _buildSectionCard(BuildContext context, String title, String image, String content) {
    // Getting screen size using MediaQuery for better layout control
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      margin: EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Displaying the image and text
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ensure the image scales based on the screen width
                Image.asset(
                  image,
                  width: screenWidth * 0.2,  // Dynamic width (20% of screen width)
                  height: screenWidth * 0.2,  // Dynamic height (20% of screen width)
                  fit: BoxFit.cover,  // Ensures image doesn’t stretch or distort
                ),
                SizedBox(width: 15),
                // Title of the section
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,  // Increased font size for title
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Content of the section with a larger font size for explanations
            Text(
              content,
              style: TextStyle(
                fontSize: 18,  // Increased font size for content
                color: Colors.black87,
                height: 1.6, // Line height for better readability
              ),
              textAlign: TextAlign.justify,  // Justified text for a cleaner layout
            ),
          ],
        ),
      ),
    );
  }
}
