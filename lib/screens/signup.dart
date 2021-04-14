import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:provider/provider.dart';

//todo touch outside textfield doesnt work
//todo forgot passsword is just a text
//todo overflow lower screen
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isSignedUp = false;
  bool signUp = false;

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSignedUp = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
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
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 55),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: _emailController,
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
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Username',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true, //todo show-hide password
                  decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
//------------SIGN UP BUTTON----------------------------------------------------------------------------
              OutlinedButton(
                  onPressed: () async {
                    isSignedUp = await context.read<UserRepository>().signUp(
                        email: _emailController.text,
                        password: _passwordController.text);
                    if (isSignedUp) {
                      setState(() {
                        signUp = true;
                      });
                      if (signUp) {
                        Navigator.pushNamed(context, '/offers');
                      }
                    }
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                  style: OutlinedButton.styleFrom(
                      primary: Colors.deepPurple,
                      side: BorderSide(color: Colors.deepPurple))),
              Text('or'),
              OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child:
                      Text('Login', style: TextStyle(color: Colors.blueGrey))),
            ]),
          ),
        ),
      ),
    );
  }
}
