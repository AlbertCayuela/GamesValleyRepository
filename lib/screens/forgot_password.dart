import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:validators/validators.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Forgot Password?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (!isEmail(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  controller: _emailController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.mail),
                    labelText: 'Introduce your email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        await context
                            .read<UserRepository>()
                            .ForgotPassword(_emailController.text)
                            .then((value) {
                          if (value == true) {
                            Navigator.of(context).pop();
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Email not correct! :('),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'))
                                    ],
                                  );
                                });
                          }
                        });
                      }
                    },
                    child: Text('Send password update request')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
