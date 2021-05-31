import 'package:flutter/material.dart';

class StudiesEditScreen extends StatelessWidget {
  List studies;
  StudiesEditScreen(this.studies);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit your studies',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          for (int i = 0; i < studies.length; i++)
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(studies[i][0]),
                      Text(studies[i][1]),
                      Text(studies[i][2]),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: Icon(
                          Icons.clear,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
