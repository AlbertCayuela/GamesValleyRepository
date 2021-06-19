import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class ForgotPasswordScreen extends StatelessWidget {
  TextEditingController _emailController;
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
                  onPressed: () {},
                  child: Text('Send password update request')),
            ],
          ),
        ),
      ),
    );
  }
}
