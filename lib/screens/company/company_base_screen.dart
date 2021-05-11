import 'package:flutter/material.dart';
import 'package:games_valley/screens/profile/profile.dart';

import '../offers.dart';
import 'company_offers_screen.dart';
import 'company_profile_screen.dart';

class CompanyBaseScreen extends StatefulWidget {
  int index;

  CompanyBaseScreen({Key key, this.index}) : super(key: key);

  @override
  _CompanyBaseScreenState createState() => _CompanyBaseScreenState();
}

class _CompanyBaseScreenState extends State<CompanyBaseScreen> {
  int _currentIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.index != null) {
      _currentIndex = widget.index;
    } else {
      _currentIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    switch (_currentIndex) {
      case 0:
        body = CompanyOffersScreen();
        break;
      case 1:
        body = CompanyProfileScreen();
        break;
    }
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.work), label: 'Your Offers'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index)),
      body: body,
    );
  }
}
