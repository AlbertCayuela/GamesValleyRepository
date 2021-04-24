import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:validators/validators.dart';
import 'package:provider/provider.dart';

class EditStudiesScreen extends StatefulWidget {
  @override
  _EditStudiesScreenState createState() => _EditStudiesScreenState();
}

class _EditStudiesScreenState extends State<EditStudiesScreen> {
  String startingMonth;
  String finishMonth;
  TextEditingController _typeOfStudiesController = TextEditingController();
  TextEditingController _centerOfStudiesController = TextEditingController();
  TextEditingController _startingYearController = TextEditingController();
  TextEditingController _finishingYearController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit your studies'),
      ),
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
                    'Add new studies',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Please enter the type of your studies';
                      }
                      return null;
                    },
                    controller: _typeOfStudiesController,
                    decoration: InputDecoration(
                      //icon: Icon(Icons.mail),
                      labelText: 'Type of studies (Ex.: Bachelor)*',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _centerOfStudiesController,
                    decoration: InputDecoration(
                      //icon: Icon(Icons.mail),
                      labelText: 'Center of studies*',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value) {
                      if (value.isEmpty || value == null) {
                        return 'Please enter the center of your studies';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a monnth';
                      }
                      return null;
                    },
                    isExpanded: true,
                    value: startingMonth,
                    hint: Text('Starting month*'),
                    items: [
                      DropdownMenuItem(
                        child: Text('January'),
                        value: 'January',
                      ),
                      DropdownMenuItem(
                        child: Text('February'),
                        value: 'February',
                      ),
                      DropdownMenuItem(child: Text('March'), value: 'March'),
                      DropdownMenuItem(
                        child: Text('April'),
                        value: 'April',
                      ),
                      DropdownMenuItem(
                        child: Text('May'),
                        value: 'May',
                      ),
                      DropdownMenuItem(
                        child: Text('June'),
                        value: 'June',
                      ),
                      DropdownMenuItem(
                        child: Text('July'),
                        value: 'July',
                      ),
                      DropdownMenuItem(child: Text('August'), value: 'August'),
                      DropdownMenuItem(
                        child: Text('September'),
                        value: 'September',
                      ),
                      DropdownMenuItem(
                        child: Text('October'),
                        value: 'October',
                      ),
                      DropdownMenuItem(
                        child: Text('November'),
                        value: 'November',
                      ),
                      DropdownMenuItem(
                        child: Text('December'),
                        value: 'December',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        startingMonth = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _startingYearController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Plase enter a year';
                      } else if (!isNumeric(value)) {
                        return 'You must enter a number! Ex: 2021';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Starting year*',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 10),
                  DropdownButton(
                    isExpanded: true,
                    value: finishMonth,
                    hint: Text('Finishing month'),
                    items: [
                      DropdownMenuItem(
                        child: Text('January'),
                        value: 'January',
                      ),
                      DropdownMenuItem(
                        child: Text('February'),
                        value: 'February',
                      ),
                      DropdownMenuItem(child: Text('March'), value: 'March'),
                      DropdownMenuItem(
                        child: Text('April'),
                        value: 'April',
                      ),
                      DropdownMenuItem(
                        child: Text('May'),
                        value: 'May',
                      ),
                      DropdownMenuItem(
                        child: Text('June'),
                        value: 'June',
                      ),
                      DropdownMenuItem(
                        child: Text('July'),
                        value: 'July',
                      ),
                      DropdownMenuItem(child: Text('August'), value: 'August'),
                      DropdownMenuItem(
                        child: Text('September'),
                        value: 'September',
                      ),
                      DropdownMenuItem(
                        child: Text('October'),
                        value: 'October',
                      ),
                      DropdownMenuItem(
                        child: Text('November'),
                        value: 'November',
                      ),
                      DropdownMenuItem(
                        child: Text('December'),
                        value: 'December',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        finishMonth = value;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _finishingYearController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Finishing year',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        print('Everything ok!');
                        context.read<UserRepository>().addStudies(
                              typeOfStudies: _typeOfStudiesController.text,
                              centerOfStudies: _centerOfStudiesController.text,
                              startingMonth: startingMonth,
                              startingYear: _startingYearController.text,
                              finishingMonth: finishMonth,
                              finishingYear: _finishingYearController.text,
                            );
                      } else {
                        print('something wrong!');
                      }
                    },
                    child: Text('Add studies'),
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
