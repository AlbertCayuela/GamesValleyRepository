import 'package:flutter/material.dart';

class WorkEditScreen extends StatelessWidget {
  List workExperiences;
  WorkEditScreen(this.workExperiences);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
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
                        Text(workExperiences[i][0]),
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
