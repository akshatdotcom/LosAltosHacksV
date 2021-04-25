import 'package:flutter/material.dart';
import 'package:teachapp/chat.dart';
import 'package:teachapp/resource.dart';
import 'package:teachapp/calendar.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _bodys = [ResourcePage(), CalendarPage(), ChatPage()];
  int _bodysIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          'TeachApp',
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: IndexedStack(
        index: _bodysIndex,
        children: _bodys,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _bodysIndex = index;
          });
        },
        currentIndex: _bodysIndex,
        items: [
          BottomNavigationBarItem(
            label: 'Resources',
            icon: Icon(Icons.find_in_page),
          ),
          BottomNavigationBarItem(
            label: 'Calendar',
            icon: Icon(Icons.calendar_today),
          ),
          BottomNavigationBarItem(
            label: 'Chat',
            icon: Icon(Icons.chat_bubble),
          ),
        ],
      ),
    );
  }
}
