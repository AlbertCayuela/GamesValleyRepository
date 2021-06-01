import 'package:flutter/material.dart';

class WorkEditScreen extends StatelessWidget {
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
    );
  }
}
