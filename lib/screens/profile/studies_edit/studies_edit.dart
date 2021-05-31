import 'package:flutter/material.dart';

class StudiesEditScreen extends StatelessWidget {
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
    );
  }
}
