import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:provider/provider.dart';

class EditWorkScreen extends StatefulWidget {
  @override
  _EditWorkScreenState createState() => _EditWorkScreenState();
}

class _EditWorkScreenState extends State<EditWorkScreen> {
  String startingMonth;
  String finishMonth;

  TextEditingController _jobController = TextEditingController();
  TextEditingController _companyController = TextEditingController();
  TextEditingController _startingYearController = TextEditingController();
  TextEditingController _finishingYearController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit your work experience',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Add experience',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _jobController,
                    decoration: InputDecoration(
                      //icon: Icon(Icons.mail),
                      labelText: 'Job',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _companyController,
                    decoration: InputDecoration(
                      //icon: Icon(Icons.mail),
                      labelText: 'Company',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 10),
                  DropdownButton(
                    isExpanded: true,
                    value: startingMonth,
                    hint: Text('Starting month'),
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
                  TextField(
                    controller: _startingYearController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Starting year',
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
                        context.read<UserRepository>().addJobExperience(
                              job: _jobController.text,
                              company: _companyController.text,
                              startingMonth: startingMonth,
                              startingYear: _startingYearController.text,
                              finishingMonth: finishMonth,
                              finishYear: _finishingYearController.text,
                            );
                        //Navigator.pop(context);
                      },
                      child: Text('Add experience')),
                ]),
          ),
        ),
      ),
    );
  }
}
