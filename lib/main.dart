import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:games_valley/screens/base.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:games_valley/screens/login.dart';
import 'package:games_valley/screens/profile.dart';
import 'package:games_valley/screens/signup.dart';
import 'package:provider/provider.dart';

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
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/offers': (context) => LoginScreen(),
        '/profile': (context) => ProfileScreen(),
      },
      home: MultiProvider(
        child: AuthWrapper(),
        providers: [
          Provider<UserRepository>(
              create: (_) => UserRepository(FirebaseAuth.instance)),
          StreamProvider(
              create: (context) =>
                  context.read<UserRepository>().authStateChanges),
        ],
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return BaseScreen();
    }
    return LoginScreen();
  }
}
