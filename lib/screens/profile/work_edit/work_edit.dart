import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:games_valley/screens/profile/work_edit/work_create.dart';
import 'package:provider/provider.dart';

class WorkEditScreen extends StatefulWidget {
  List workExperiences;
  WorkEditScreen(this.workExperiences);

  @override
  _WorkEditScreenState createState() => _WorkEditScreenState();
}

class _WorkEditScreenState extends State<WorkEditScreen> {
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
                        builder: (BuildContext context) => CreateWorkScreen()))
                .then((value) {
              if (value != null) {
                setState(() {
                  widget.workExperiences = value;
                });
              }
            });
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
            for (int i = 0; i < widget.workExperiences.length; i++)
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
                        widget.workExperiences[i][1] != null &&
                                widget.workExperiences[i][1] != ''
                            ? Text(widget.workExperiences[i][0] +
                                ' at ' +
                                widget.workExperiences[i][1])
                            : Text(widget.workExperiences[i][0]),
                        widget.workExperiences[i][4] != null &&
                                widget.workExperiences[i][4] != ''
                            ? Text(
                                widget.workExperiences[i][2] +
                                    ' ' +
                                    widget.workExperiences[i][3] +
                                    ' - ' +
                                    widget.workExperiences[i][4] +
                                    ' ' +
                                    widget.workExperiences[i][5],
                                style: TextStyle(color: Colors.blueGrey),
                              )
                            : Text(
                                widget.workExperiences[i][2] +
                                    ' ' +
                                    widget.workExperiences[i][3] +
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
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text(
                                  'Do you want to delete this work experience?'),
                              actions: [
                                TextButton(
                                    child: Text('Yes'),
                                    onPressed: () async {
                                      await context
                                          .read<UserRepository>()
                                          .updateWorkExperiences(
                                              widget.workExperiences, i)
                                          .then((_) async {
                                        context
                                            .read<UserRepository>()
                                            .getWorkExperiences()
                                            .then((value) {
                                          setState(() {
                                            widget.workExperiences = value;
                                          });
                                        });
                                      });
                                      Navigator.pop(context);
                                    }),
                                TextButton(
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    })
                              ],
                            );
                          });
                    },
                  )
                ]),
              ),
          ]),
        ));
  }
}
