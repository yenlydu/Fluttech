import 'package:flutter/material.dart';

//File Page Includ
import 'package:flutter2/Mobile/Page/Profilepage/Profile.dart';
import '../CalendarPage/Calendar.dart';
import '../ProjectsPage/Projects.dart';
import '../NotificationsPage/Notifications.dart';

class NavElem extends StatefulWidget {
  NavElem({Key key, this.title = ""}) : super(key: key);

  final String title;

  @override
  _NavElemState createState() => _NavElemState();
}

class _NavElemState extends State<NavElem> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          ProfilePage(),
          ProjectsPage(),
          CalendarPage(),
          NotificationsPage(),
        ],
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF664C9E),
        selectedFontSize: 15,
        unselectedFontSize: 12,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_module),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
