import 'package:flutter/material.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  TextEditingController _issueController = TextEditingController();
  bool _isSubmitted = false;

  void _submitIssue() {
    setState(() {
      _isSubmitted = true; 
    });

    
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isSubmitted = false;
      });
      _issueController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support'),
        backgroundColor: Color(0xFF2196F3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            Text(
              'Describe your issue or problem below:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            
            TextField(
              controller: _issueController,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type your issue here...',
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
            ),
            SizedBox(height: 20),

            // Submit Button
            Align(
              alignment: Alignment.bottomLeft,
              child: ElevatedButton(
                onPressed: _submitIssue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2196F3), 
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            
            if (_isSubmitted)
              Text(
                'Your problem has been submitted, it will be resolved soon.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
