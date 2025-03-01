import 'package:flutter/material.dart';

class ChatWithMentorPage extends StatefulWidget {
  final String mentorName;
  ChatWithMentorPage({required this.mentorName});

  @override
  _ChatWithMentorPageState createState() => _ChatWithMentorPageState();
}

class _ChatWithMentorPageState extends State<ChatWithMentorPage> {
  TextEditingController _messageController = TextEditingController();
  List<Map<String, String>> messages = [];

  
  String mentorReply = "Sure, Tell me if you need any guidance about applying to universities";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.mentorName}'),
        backgroundColor: Color(0xFF2196F3),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, 
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: messages[index]['sender'] == 'mentor'
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: messages[index]['sender'] == 'mentor' ? Colors.blue[50] : Color(0xFF2196F3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        messages[index]['text']!,
                        style: TextStyle(color: messages[index]['sender'] == 'mentor' ? Colors.black : Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                  color: Color(0xFF2196F3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

 
  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
       
        messages.insert(0, {'sender': 'user', 'text': _messageController.text});
        
        messages.insert(0, {'sender': 'mentor', 'text': mentorReply});
        _messageController.clear();
      });
    }
  }
}
