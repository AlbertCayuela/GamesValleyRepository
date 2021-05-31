import 'package:flutter/material.dart';

class LanguageDeleteScreen extends StatelessWidget {
  final List languages;
  LanguageDeleteScreen(this.languages);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit you languages',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        for (int i = 0; i < languages.length; i++)
          Container(
            child: Row(children: []),
          )
      ]),
    );
  }
}
