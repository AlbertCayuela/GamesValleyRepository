import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

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
  bool hidePassword = true;

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
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
                  child: TextFormField(
                    validator: (value) {
                      if (!isEmail(value)) {
                        return 'Please introduce a valid email';
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
                        return 'Please enter a username';
                      }
                      return null;
                    },
                    controller: _userNameController,
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
                  child: TextFormField(
                    validator: (value) {
                      if (value.length < 8) {
                        return 'The password must contain at least 8 symbols';
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
                      ),
                    ),
                  ),
                ),
//------------SIGN UP BUTTON----------------------------------------------------------------------------
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      isSignedUp = await context.read<UserRepository>().signUp(
                          email: _emailController.text,
                          password: _passwordController.text,
                          isCompany: false,
                          userName: _userNameController.text);
                      if (isSignedUp) {
                        setState(() {
                          signUp = true;
                        });
                        if (signUp) {
                          //todo change this pushnamed
                          Navigator.pushNamed(context, '/offers');
                        }
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text('Something went wrong! :('),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('OK'))
                                ],
                              );
                            });
                      }
                    }
                  },
                  child: Text(
                    'Sign Up',
                  ),
                ),
                Text('or'),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        primary: Colors.deepPurple,
                        side: BorderSide(color: Colors.deepPurple)),
                    onPressed: () => Navigator.pop(context),
                    child: Text('Login',
                        style: TextStyle(color: Colors.deepPurple))),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
