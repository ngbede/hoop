import 'package:flutter/material.dart';
import 'package:hoop/screens/views/results.dart';
import 'package:hoop/screens/views/standings.dart';
import 'package:hoop/screens/views/players.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedScreen = 0;
  List<Widget> views = [
    Standings(),
    Results(),
    Players(),
  ];

  void onTapChangeView(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          false, // prevent user from navigating to the loading screen
      child: SafeArea(
        child: Scaffold(
          body: views.elementAt(_selectedScreen),
          backgroundColor: Color(0XFFEDF1FF),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.table_chart_outlined),
                label: "Standings",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_basketball_sharp),
                label: "Games",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Teams",
              ),
            ],
            currentIndex: _selectedScreen,
            onTap: onTapChangeView,
            selectedItemColor: Color(0XFF1F6BA3),
          ),
        ),
      ),
    );
  }
}
