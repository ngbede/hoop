import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'screens/standings.dart';
import 'screens/fixtures.dart';
import 'screens/results.dart';

class Layout extends StatefulWidget {
  final dynamic jsonFile;
  Layout({@required this.jsonFile});
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _page = 0;
  List<Widget> _screens = [
    Standing(json: widget.jsonFile),
    Fixtures(),
    Results()
  ];
  void changeView(int index) {
    setState(
      () {
        _page = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _screens[_page],
      ),
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.table,
            ),
            title: Text('Standings'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.basketballBall),
            title: Text('Fixtures'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.crown),
            title: Text('Results'),
          ),
        ],
        currentIndex: _page,
        selectedItemColor: Color(0xFF2372A3),
        onTap: changeView,
      ),
    );
  }
}
