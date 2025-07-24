import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  
  final Map<DateTime, String> _importantDates = {
    DateTime(2025, 6, 10): "Application Deadline for Duke University",
    DateTime(2025, 6, 15): "Scholarship Deadline for AAUW International Fellowship",
    DateTime(2025, 7, 20): "Last Date to Submit Application for DEF University",
    DateTime(2025, 7, 5): "Early Bird Application for GHI University",
    DateTime(2025, 5, 18): "Final Submission Deadline for JKL Scholarship",
    DateTime(2025, 8, 25): "Application Deadline for MNO University",
    
  };

  
  String getDeadlineInfo(DateTime date) {
    DateTime formattedDate = DateTime(date.year, date.month, date.day);
    return _importantDates[formattedDate] ?? "No deadlines on this day.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deadlines Calendar'),
        backgroundColor: Color(0xFF2196F3),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime(2025, 1, 1),
            lastDay: DateTime(2025, 12, 31),
            eventLoader: (day) {
              
              DateTime formattedDate = DateTime(day.year, day.month, day.day);
              if (_importantDates.containsKey(formattedDate)) {
                return [_importantDates[formattedDate]!];
              }
              return [];
            },
            calendarStyle: CalendarStyle(
              
              todayDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.transparent, 
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red, width: 2), 
              ),
              
              markerDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              
              defaultDecoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.transparent), 
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronIcon: Icon(Icons.chevron_left),
              rightChevronIcon: Icon(Icons.chevron_right),
            ),
            onDaySelected: (selectedDay, focusedDay) {
              
              final deadlineInfo = getDeadlineInfo(selectedDay);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Deadline Information'),
                    content: Text(deadlineInfo),
                    actions: <Widget>[
                      TextButton(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
