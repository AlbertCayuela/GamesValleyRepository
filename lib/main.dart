import 'package:flutter/material.dart';
import 'package:games_valley/screens/base.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:games_valley/screens/signup.dart';

//*-----------------------------MAIN--------------------------------------------
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: SignUpScreen(),
    );
  }
}
