import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

class CreateWorkScreen extends StatefulWidget {
  @override
  _CreateWorkScreenState createState() => _CreateWorkScreenState();
}

class _CreateWorkScreenState extends State<CreateWorkScreen> {
  String startingMonth;
  String finishMonth;

  TextEditingController _jobController = TextEditingController();
  TextEditingController _companyController = TextEditingController();
  TextEditingController _startingYearController = TextEditingController();
  TextEditingController _finishingYearController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add a new work experience',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty || value == null) {
                          return 'Please enter the job';
                        }
                        return null;
                      },
                      controller: _jobController,
                      decoration: InputDecoration(
                        //icon: Icon(Icons.mail),
                        labelText: 'Job*',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _companyController,
                      decoration: InputDecoration(
                        //icon: Icon(Icons.mail),
                        labelText: 'Company',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
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
                        DropdownMenuItem(
                            child: Text('August'), value: 'August'),
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Plase enter a year';
                        } else if (!isNumeric(value)) {
                          return 'You must enter a number! Ex: 2021';
                        }
                        return null;
                      },
                      controller: _startingYearController,
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
                        DropdownMenuItem(
                            child: Text('August'), value: 'August'),
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
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            print('all ok!');
                            context.read<UserRepository>().addJobExperience(
                                  job: _jobController.text,
                                  company: _companyController.text,
                                  startingMonth: startingMonth,
                                  startingYear: _startingYearController.text,
                                  finishingMonth: finishMonth,
                                  finishYear: _finishingYearController.text,
                                );
                            await context
                                .read<UserRepository>()
                                .getWorkExperiences()
                                .then((value) {
                              Navigator.pop(context, value);
                            });
                          } else {
                            print('Something wrong!');
                          }
                        },
                        child: Text('Add experience')),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
