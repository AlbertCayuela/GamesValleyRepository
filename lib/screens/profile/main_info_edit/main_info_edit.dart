import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:provider/provider.dart';

class EditMainInfoScreen extends StatefulWidget {
  @override
  _EditMainInfoScreenState createState() => _EditMainInfoScreenState();
}

class _EditMainInfoScreenState extends State<EditMainInfoScreen> {
  String imageUrl;

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
              child: (imageUrl != null) ? null : Icon(Icons.person, size: 45),
              radius: 50,
              backgroundImage:
                  (imageUrl != null) ? NetworkImage(imageUrl) : null,
            ),
            TextButton(
              onPressed: () {
                context
                    .read<UserRepository>()
                    .pickImageAndUpload()
                    .then((value) {
                  setState(() {
                    imageUrl = value;
                  });
                });
              },
              child: Text('Edit profile image'),
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
            SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: Text('Edit information')),
          ],
        ),
      ),
    );
  }
}
