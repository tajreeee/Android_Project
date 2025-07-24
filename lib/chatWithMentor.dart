// import 'package:flutter/material.dart';

// class ChatWithMentorPage extends StatefulWidget {
//   final String mentorName;
//   ChatWithMentorPage({required this.mentorName});

//   @override
//   _ChatWithMentorPageState createState() => _ChatWithMentorPageState();
// }

// class _ChatWithMentorPageState extends State<ChatWithMentorPage> {
//   TextEditingController _messageController = TextEditingController();
//   List<Map<String, String>> messages = [];
//   String mentorReply = "Sure, tell me if you need any guidance about applying to universities";

//   bool isDarkMode = false;

//   ThemeData get _lightTheme => ThemeData(
//         brightness: Brightness.light,
//         primaryColor: Color(0xFF2196F3),
//         scaffoldBackgroundColor: Colors.white,
//         appBarTheme: AppBarTheme(backgroundColor: Color(0xFF2196F3)),
//       );

//   ThemeData get _darkTheme => ThemeData(
//         brightness: Brightness.dark,
//         primaryColor: Colors.blueGrey[900],
//         scaffoldBackgroundColor: Color(0xFF121212),
//         appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey[900]),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: isDarkMode ? _darkTheme : _lightTheme,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Chat with ${widget.mentorName}'),
//           actions: [
//             IconButton(
//               icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
//               onPressed: () {
//                 setState(() {
//                   isDarkMode = !isDarkMode;
//                 });
//               },
//             ),
//           ],
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 reverse: true,
//                 itemCount: messages.length,
//                 itemBuilder: (context, index) {
//                   final msg = messages[index];
//                   final isMentor = msg['sender'] == 'mentor';
//                   return Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                     child: Row(
//                       mainAxisAlignment:
//                           isMentor ? MainAxisAlignment.start : MainAxisAlignment.end,
//                       children: [
//                         if (isMentor)
//                           CircleAvatar(
//                             backgroundColor: Colors.blue[200],
//                             child: Icon(Icons.person, color: Colors.white),
//                           ),
//                         if (!isMentor) SizedBox(width: 8),
//                         Flexible(
//                           child: Container(
//                             padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//                             decoration: BoxDecoration(
//                               color: isMentor
//                                   ? (isDarkMode ? Colors.grey[800] : Colors.blue[50])
//                                   : (isDarkMode ? Colors.blue[700] : Color(0xFF2196F3)),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(18),
//                                 topRight: Radius.circular(18),
//                                 bottomLeft: Radius.circular(isMentor ? 0 : 18),
//                                 bottomRight: Radius.circular(isMentor ? 18 : 0),

//                               ),
//                             ),

//                             child: Text(
//                               msg['text']!,
//                               style: TextStyle(
//                                 color: isMentor
//                                     ? (isDarkMode ? Colors.white : Colors.black)
//                                     : Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                         if (isMentor) SizedBox(width: 8),
//                         if (!isMentor)
//                           CircleAvatar(
//                             backgroundColor: Colors.green[400],
//                             child: Icon(Icons.person_2_rounded, color: Colors.white),
//                           ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Divider(height: 1),
//             Container(
//               color: Theme.of(context).scaffoldBackgroundColor,
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _messageController,
//                       style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
//                       decoration: InputDecoration(
//                         hintText: 'Type a message...',
//                         hintStyle:
//                             TextStyle(color: isDarkMode ? Colors.grey[400] : Colors.grey[700]),
//                         filled: true,
//                         fillColor: isDarkMode ? Colors.grey[900] : Colors.grey[200],
//                         contentPadding:
//                             EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 8),
//                   CircleAvatar(
//                     backgroundColor: Color(0xFF2196F3),
//                     child: IconButton(
//                       icon: Icon(Icons.send, color: Colors.white),
//                       onPressed: _sendMessage,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _sendMessage() {
//     if (_messageController.text.trim().isNotEmpty) {
//       setState(() {
//         messages.insert(0, {
//           'sender': 'user',
//           'text': _messageController.text.trim(),
//         });
//         messages.insert(0, {
//           'sender': 'mentor',
//           'text': mentorReply,
//         });
//         _messageController.clear();
//       });
//     }
//   }
// }




// import 'package:flutter/material.dart';

// class ChatWithMentorPage extends StatefulWidget {
//   final String mentorName;
//   ChatWithMentorPage({required this.mentorName});

//   @override
//   _ChatWithMentorPageState createState() => _ChatWithMentorPageState();
// }

// class _ChatWithMentorPageState extends State<ChatWithMentorPage> {
//   TextEditingController _messageController = TextEditingController();
//   List<Map<String, String>> messages = [];
//   String mentorReply = "Sure, tell me if you need any guidance about applying to universities";

//   bool isDarkMode = false;

//   ThemeData get _lightTheme => ThemeData(
//         brightness: Brightness.light,
//         primaryColor: Color(0xFF2196F3),
//         scaffoldBackgroundColor: Colors.white,
//         appBarTheme: AppBarTheme(backgroundColor: Color(0xFF2196F3)),
//       );

//   ThemeData get _darkTheme => ThemeData(
//         brightness: Brightness.dark,
//         primaryColor: Colors.blueGrey[900],
//         scaffoldBackgroundColor: Color(0xFF121212),
//         appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey[900]),
//       );


//   // Extracted color logic for chat bubble background
//   Color chatBubbleColor(bool isMentor) {
//     if (isMentor) {
//       return isDarkMode ? Colors.grey[800]! : Colors.blue[50]!;
//     } else {
//       return isDarkMode ? Colors.blue[700]! : Color(0xFF2196F3);
//     }
//   }

//   // Extracted text color for chat bubble text
//   Color chatTextColor(bool isMentor) {
//     if (isMentor) {
//       return isDarkMode ? Colors.white : Colors.black;
//     } else {
//       return Colors.white;
//     }
//   }

//   // Extracted hint text color for message input
//   Color get hintTextColor => isDarkMode ? Colors.grey[400]! : Colors.grey[700]!;

//   // Extracted fill color for message input background
//   Color get inputFillColor => isDarkMode ? Colors.grey[900]! : Colors.grey[200]!;

//   // Extracted text color for message input text
//   Color get inputTextColor => isDarkMode ? Colors.white : Colors.black;




//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: isDarkMode ? _darkTheme : _lightTheme,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Chat with ${widget.mentorName}'),
//           actions: [
//             IconButton(
//               icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
//               onPressed: () {
//                 setState(() {
//                   isDarkMode = !isDarkMode;
//                 });
//               },
//             ),
//           ],
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 reverse: true,
//                 itemCount: messages.length,
//                 itemBuilder: (context, index) {
//                   final msg = messages[index];
//                   final isMentor = msg['sender'] == 'mentor';
//                   return Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                     child: Row(
//                       mainAxisAlignment:
//                           isMentor ? MainAxisAlignment.start : MainAxisAlignment.end,
//                       children: [
//                         if (isMentor)
//                           CircleAvatar(
//                             backgroundColor: Colors.blue[200],
//                             child: Icon(Icons.person, color: Colors.white),
//                           ),
//                         if (!isMentor) SizedBox(width: 8),
//                         Flexible(
//                           child: Container(
//                             padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//                             decoration: BoxDecoration(
//                               color: chatBubbleColor(isMentor),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(18),
//                                 topRight: Radius.circular(18),
//                                 bottomLeft: Radius.circular(isMentor ? 0 : 18),
//                                 bottomRight: Radius.circular(isMentor ? 18 : 0),
//                               ),
//                             ),
//                             child: Text(
//                               msg['text']!,
//                               style: TextStyle(
//                                 color: chatTextColor(isMentor),
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                         if (isMentor) SizedBox(width: 8),
//                         if (!isMentor)
//                           CircleAvatar(
//                             backgroundColor: Colors.green[400],
//                             child: Icon(Icons.person_2_rounded, color: Colors.white),
//                           ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Divider(height: 1),
//             Container(
//               color: Theme.of(context).scaffoldBackgroundColor,
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _messageController,
//                       style: TextStyle(color: inputTextColor),
//                       decoration: InputDecoration(
//                         hintText: 'Type a message...',
//                         hintStyle: TextStyle(color: hintTextColor),
//                         filled: true,
//                         fillColor: inputFillColor,
//                         contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 8),
//                   CircleAvatar(
//                     backgroundColor: Color(0xFF2196F3),
//                     child: IconButton(
//                       icon: Icon(Icons.send, color: Colors.white),
//                       onPressed: _sendMessage,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _sendMessage() {
//     if (_messageController.text.trim().isNotEmpty) {
//       setState(() {
//         messages.insert(0, {
//           'sender': 'user',
//           'text': _messageController.text.trim(),
//         });
//         messages.insert(0, {
//           'sender': 'mentor',
//           'text': mentorReply,
//         });
//         _messageController.clear();
//       });
//     }
//   }
// }
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
  String mentorReply = "Sure, tell me if you need any guidance about applying to universities";

  bool isDarkMode = false;

  ThemeData get _lightTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF2196F3),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFF2196F3)),
      );

  ThemeData get _darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey[900],
        scaffoldBackgroundColor: Color(0xFF121212),
        appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey[900]),
      );

  Color chatBubbleColor(bool isMentor) {
    if (isMentor) {
      return isDarkMode ? Colors.grey[800]! : Colors.blue[50]!;
    } else {
      return isDarkMode ? Colors.blue[700]! : Color(0xFF2196F3);
    }
  }

  Color chatTextColor(bool isMentor) {
    if (isMentor) {
      return isDarkMode ? Colors.white : Colors.black;
    } else {
      return Colors.white;
    }
  }

  Color get hintTextColor => isDarkMode ? Colors.grey[400]! : Colors.grey[700]!;
  Color get inputFillColor => isDarkMode ? Colors.grey[900]! : Colors.grey[200]!;
  Color get inputTextColor => isDarkMode ? Colors.white : Colors.black;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDarkMode ? _darkTheme : _lightTheme,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Column(
          children: [
            _buildMessageList(),
            Divider(height: 1),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }
  
  

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Chat with ${widget.mentorName}'),
      actions: [
        IconButton(
          icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
          onPressed: () {
            setState(() {
              isDarkMode = !isDarkMode;
            });
          },
        ),
      ],
    );
  }

  Widget _buildMessageList() {
    return Expanded(
      child: ListView.builder(
        reverse: true,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final msg = messages[index];
          final isMentor = msg['sender'] == 'mentor';
          return _buildChatBubble(msg['text']!, isMentor);
        },
      ),
    );
  }

  Widget _buildChatBubble(String text, bool isMentor) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        mainAxisAlignment:
            isMentor ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (isMentor)
            CircleAvatar(
              backgroundColor: Colors.blue[200],
              child: Icon(Icons.person, color: Colors.white),
            ),
          if (!isMentor) SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: chatBubbleColor(isMentor),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                  bottomLeft: Radius.circular(isMentor ? 0 : 18),
                  bottomRight: Radius.circular(isMentor ? 18 : 0),
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: chatTextColor(isMentor),
                  fontSize: 16,
                ),
              ),
            ),
          ),
          if (isMentor) SizedBox(width: 8),
          if (!isMentor)
            CircleAvatar(
              backgroundColor: Colors.green[400],
              child: Icon(Icons.person_2_rounded, color: Colors.white),
            ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              style: TextStyle(color: inputTextColor),
              decoration: InputDecoration(
                hintText: 'Type a message...',
                hintStyle: TextStyle(color: hintTextColor),
                filled: true,
                fillColor: inputFillColor,
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Color(0xFF2196F3),
            child: IconButton(
              icon: Icon(Icons.send, color: Colors.white),
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        messages.insert(0, {
          'sender': 'user',
          'text': _messageController.text.trim(),
        });
        messages.insert(0, {
          'sender': 'mentor',
          'text': mentorReply,
        });
        _messageController.clear();
      });
    }
  }
}
