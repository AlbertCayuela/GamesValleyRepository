import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:provider/provider.dart';

class EditMainInfoScreen extends StatefulWidget {
  final UserInfo user;

  EditMainInfoScreen({Key key, @required this.user}) : super(key: key);

  @override
  _EditMainInfoScreenState createState() => _EditMainInfoScreenState();
}

class _EditMainInfoScreenState extends State<EditMainInfoScreen> {
  String imageUrl;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    imageUrl = widget.user.profileImageUrl;
  }

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
              child: (imageUrl != '') ? null : Icon(Icons.person, size: 45),
              radius: 50,
              backgroundImage: (imageUrl != '') ? NetworkImage(imageUrl) : null,
            ),
            ElevatedButton(
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
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _surnameController,
              decoration: InputDecoration(
                labelText: 'Surname',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
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
