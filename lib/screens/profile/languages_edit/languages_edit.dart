import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:provider/provider.dart';

class EditLanguagesScreen extends StatefulWidget {
  @override
  _EditLanguagesScreenState createState() => _EditLanguagesScreenState();
}

class _EditLanguagesScreenState extends State<EditLanguagesScreen> {
  String level;
  TextEditingController _languageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit your languages')),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'Add language',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _languageController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a language';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Language',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    isExpanded: true,
                    value: level,
                    validator: (value) {
                      if (value == null) {
                        return 'Please select your language level';
                      }
                      return null;
                    },
                    hint: Text('Level'),
                    items: [
                      DropdownMenuItem(
                        child: Text('Native'),
                        value: 'Native',
                      ),
                      DropdownMenuItem(
                        child: Text('Proficient'),
                        value: 'Proficient',
                      ),
                      DropdownMenuItem(
                        child: Text('Medium'),
                        value: 'Medium',
                      ),
                      DropdownMenuItem(
                        child: Text('Basic'),
                        value: 'Basic',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        level = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        print('all ok!');
                        context.read<UserRepository>().addLanguages(
                              language: _languageController.text,
                              level: level,
                            );
                        Navigator.pop(context);
                      } else {
                        print('something wrong!');
                      }
                    },
                    child: Text('Add language'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
