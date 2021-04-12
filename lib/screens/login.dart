import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//todo touch outside textfield doesnt work
//todo forgot passsword is just a text

class LoginScreen extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Text(
                'GamesValley',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.mail),
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                obscureText: true, //todo show-hide password
                decoration: InputDecoration(
                  icon: Icon(Icons.vpn_key),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Text('Forgot password?'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: null,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                  style: OutlinedButton.styleFrom(
                      primary: Colors.deepPurple,
                      side: BorderSide(color: Colors.deepPurple))),
            ),
            Text('or'),
            OutlinedButton(
              child: Text(
                'Sign up',
                style: TextStyle(color: Colors.blueGrey),
              ),
              onPressed: () => Navigator.pushNamed(context, '/signup'),
            ),
          ]),
        ),
      ),
    );
  }
}