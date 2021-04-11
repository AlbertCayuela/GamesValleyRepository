import 'package:flutter/material.dart';
import 'package:games_valley/screens/offers.dart';
import 'package:games_valley/screens/profile.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget body;
    switch (_currentIndex) {
      case 0:
        body = OffersScreen();
        break;
      case 1:
        body = ProfileScreen();
        break;
    }
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Offers'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index)),
      body: body,
    );
  }
}
