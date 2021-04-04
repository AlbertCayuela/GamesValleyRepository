import 'package:flutter/material.dart';

//*-----------------------------MAIN--------------------------------------------
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: Scaffold(
        appBar: AppBar(
          title: Text('GamesValley'),      
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Offers'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          ),
      ),
    );
  }
}

