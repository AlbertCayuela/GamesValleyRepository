import 'package:flutter/material.dart';

class EditMainInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit your main information',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            CircleAvatar(
              child: Icon(
                Icons.person,
                size: 45,
              ),
              radius: 50,
              //backgroundImage: NetworkImage(               ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                //icon: Icon(Icons.mail),
                labelText: 'Name',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                //icon: Icon(Icons.mail),
                labelText: 'Surname',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                //icon: Icon(Icons.mail),
                labelText: 'Phone number (please add your country code)',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
