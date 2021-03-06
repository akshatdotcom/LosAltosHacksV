import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'globals.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  List<Widget> _daysEvents;

  _CalendarPageState() {
    _daysEvents = _getEventsForDay(DateTime.now());
  }

  List<Widget> _getEventsForDay(DateTime day) {
    List<Widget> result = [];
    for (var event in events) {
      var times = day.toString().split(' ')[0].split('-');
      if(times[2]+'-'+times[1]+'-'+times[0] == event[2]) {
        result.add(
          Container(
            width: 400,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green,
            ),
            child: Column(
              children: [
                Text(event[0], style: TextStyle(fontWeight: FontWeight.bold,),),
                Text(event[1]),
              ],
            )
          ),
        );
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).cardColor,
              ),
              child: TableCalendar(
                calendarFormat: _calendarFormat,
                focusedDay: _focusedDay,
                firstDay: DateTime.utc(2021, 1, 1),
                lastDay: DateTime.utc(2021, 12, 31),
                eventLoader: _getEventsForDay,
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = _selectedDay;
                    _daysEvents = _getEventsForDay(_selectedDay);
                  });
                },
              ),
            ),
            Text(_focusedDay.toString().split(' ')[0],
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Column(
              children: _daysEvents,
            ),
          ],
        ),
      ],
    );
  }
}
