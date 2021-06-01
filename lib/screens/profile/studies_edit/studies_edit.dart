import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:games_valley/screens/profile/studies_edit/studies_create.dart';
import 'package:provider/provider.dart';

class StudiesEditScreen extends StatefulWidget {
  List studies;
  StudiesEditScreen(this.studies);

  @override
  _StudiesEditScreenState createState() => _StudiesEditScreenState();
}

class _StudiesEditScreenState extends State<StudiesEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => CreateStudiesScreen()))
              .then((value) {
            if (value != null) {
              setState(() {
                widget.studies = value;
              });
            }
          });
        },
        label: Text('Add new studies'),
        icon: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit your studies',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < widget.studies.length; i++)
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.studies[i][0] +
                              ' at ' +
                              widget.studies[i][1]),
                          widget.studies[i][4] != '' &&
                                  widget.studies[i][4] != null
                              ? Text(
                                  widget.studies[i][2] +
                                      ' ' +
                                      widget.studies[i][3] +
                                      ' - ' +
                                      widget.studies[i][4] +
                                      ' ' +
                                      widget.studies[i][5],
                                  style: TextStyle(color: Colors.blueGrey),
                                )
                              : Text(
                                  widget.studies[i][2] +
                                      ' ' +
                                      widget.studies[i][3] +
                                      ' - Present',
                                  style: TextStyle(color: Colors.blueGrey),
                                ),
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
                                    'Do you want to delete these studies?'),
                                actions: [
                                  TextButton(
                                      child: Text('Yes'),
                                      onPressed: () async {
                                        await context
                                            .read<UserRepository>()
                                            .updateStudies(
                                                this.widget.studies, i)
                                            .then((_) async {
                                          await context
                                              .read<UserRepository>()
                                              .getStudies();
                                        }).then((value) {
                                          setState(() {
                                            widget.studies = value;
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
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
