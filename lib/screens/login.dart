import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:games_valley/screens/forgot_password.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

//todo forgot passsword is just a text

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool logInSuccess = true;
  bool logInError = false;
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
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
                        'Login',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (!isEmail(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
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
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      controller: _passwordController,
                      obscureText: hidePassword, //todo show-hide password
                      decoration: InputDecoration(
                          icon: Icon(Icons.vpn_key),
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          suffixIcon: TextButton(
                            child: hidePassword == true
                                ? Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          )),
                    ),
                  ),
                  TextButton(
                    child: Text('Forgot password?'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ForgotPasswordScreen()));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
//LOGIN BUTTON--------------------------------------------------------------------------------------
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          logInSuccess = await context
                              .read<UserRepository>()
                              .signIn(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                          print(logInSuccess);
                          setState(() {
                            logInError = !logInSuccess;
                          });
                          if (logInError) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                        'Email and/or password not correct :('),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('OK')),
                                    ],
                                  );
                                });
                          }
                        }
                      },
                      child: Text(
                        'Login',
                      ),
                    ),
                  ),
//--------------------------------------------------------------------------------------------------------
                  Text('or'),
                  OutlinedButton(
                    child: Text(
                      'Are you a user? Sign up here',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    style: OutlinedButton.styleFrom(
                        primary: Colors.deepPurple,
                        side: BorderSide(color: Colors.deepPurple)),
                    onPressed: () => Navigator.pushNamed(context, '/signup'),
                  ),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/companysignup');
                      },
                      child: Text(
                        'Are you a company? Sign up here',
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                      style: OutlinedButton.styleFrom(
                          primary: Colors.deepPurple,
                          side: BorderSide(color: Colors.deepPurple))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
