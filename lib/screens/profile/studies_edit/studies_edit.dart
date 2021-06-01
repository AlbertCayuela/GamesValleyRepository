import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:games_valley/screens/profile/studies_edit/studies_create.dart';
import 'package:provider/provider.dart';

class StudiesEditScreen extends StatelessWidget {
  List studies;
  StudiesEditScreen(this.studies);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => CreateStudiesScreen()));
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
            for (int i = 0; i < studies.length; i++)
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
                          Text(studies[i][0] + ' at ' + studies[i][1]),
                          studies[i][4] != '' && studies[i][4] != null
                              ? Text(
                                  studies[i][2] +
                                      ' ' +
                                      studies[i][3] +
                                      ' - ' +
                                      studies[i][4] +
                                      ' ' +
                                      studies[i][5],
                                  style: TextStyle(color: Colors.blueGrey),
                                )
                              : Text(
                                  studies[i][2] + studies[i][3] + ' - Present',
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
                                      onPressed: () {
                                        context
                                            .read<UserRepository>()
                                            .updateStudies(studies, i);
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
