import 'package:flutter/material.dart';

class LanguageDeleteScreen extends StatelessWidget {
  final List languages;
  LanguageDeleteScreen(this.languages);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(
            'Edit you languages',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey,
            child: Column(children: [
              for (int i = 0; i < languages.length; i++)
                Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Text(languages[i][0]),
                        Text(
                          ' - ',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                        Text(languages[i][1],
                            style: TextStyle(color: Colors.blueGrey)),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                child: Icon(Icons.clear, color: Colors.red),
                                onPressed: () {}),
                          ),
                        )
                      ],
                    ))
            ]),
          ),
        ));
  }
}
