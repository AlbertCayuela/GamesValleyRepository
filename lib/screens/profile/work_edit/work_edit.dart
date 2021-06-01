import 'package:flutter/material.dart';
import 'package:games_valley/screens/profile/work_edit/work_create.dart';

class WorkEditScreen extends StatelessWidget {
  List workExperiences;
  WorkEditScreen(this.workExperiences);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        floatingActionButton: FloatingActionButton.extended(
          label: Text('Add a new work experience'),
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => CreateWorkScreen()));
          },
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Edit your work experiences',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            for (int i = 0; i < workExperiences.length; i++)
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                ),
                child: Row(children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        workExperiences[i][1] != null &&
                                workExperiences[i][1] != ''
                            ? Text(workExperiences[i][0] +
                                ' at ' +
                                workExperiences[i][1])
                            : Text(workExperiences[i][0]),
                        workExperiences[i][4] != null &&
                                workExperiences[i][4] != ''
                            ? Text(
                                workExperiences[i][2] +
                                    ' ' +
                                    workExperiences[i][3] +
                                    ' - ' +
                                    workExperiences[i][4] +
                                    ' ' +
                                    workExperiences[i][5],
                                style: TextStyle(color: Colors.blueGrey),
                              )
                            : Text(
                                workExperiences[i][2] +
                                    ' ' +
                                    workExperiences[i][3] +
                                    ' - Present',
                                style: TextStyle(color: Colors.blueGrey),
                              )
                      ],
                    ),
                  ),
                  TextButton(
                    child: Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                    onPressed: () {},
                  )
                ]),
              ),
          ]),
        ));
  }
}
