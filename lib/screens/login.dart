import 'package:flutter/material.dart';


//todo touch outside textfield doesnt work
//todo forgot passsword is just a text

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(   
          children:[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Text('GamesValley', style: TextStyle(color: Colors.deepPurple, fontSize: 40, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.mail),
                  labelText: 'Email', 
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),                
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
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),             
              ),
            ),
            OutlinedButton(
              onPressed: null, 
              child: Text('Login', style: TextStyle(color: Colors.deepPurple),),
              style: OutlinedButton.styleFrom(
                primary: Colors.deepPurple,
                side: BorderSide(color: Colors.deepPurple)
              )
              ),
            Text('or'),
            OutlinedButton(onPressed: null, child: Text('Sign up')),
            Expanded(child: Align(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Forgot password?'),
            ), alignment: Alignment.bottomCenter,)),
          ]
        ),
      ),
    );
  }
}