import 'package:flutter/material.dart';
import 'package:games_valley/screens/login.dart';
import 'package:games_valley/screens/offers.dart';

//*-----------------------------MAIN--------------------------------------------
void main() async {
  runApp(GamesValley());
}

class GamesValley extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GamesValley',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'OpenSans',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OffersScreen(),
    );
  }
}

